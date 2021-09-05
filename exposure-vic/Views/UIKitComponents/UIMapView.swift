//
//  UIMapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 4/9/21.
//

import SwiftUI
import MapKit

struct UIMapView: UIViewRepresentable {
	
	@EnvironmentObject var mapViewModel: MapViewModel
	@EnvironmentObject var settingsViewModel: SettingsViewModel
	@EnvironmentObject var exposureViewModel: ExposureViewModel

	
	// assign the coordinator
	func makeCoordinator() -> Coordinator {
		Coordinator()
	}
	
	// first build of view
	func makeUIView(context: Context) -> MKMapView {
		let view = mapViewModel.mapView
		drawOverlayRing(view: view)
		
		getAnnotations(view: view)
		
		view.showsUserLocation = true
		view.delegate = context.coordinator
		return view
	}
	
	// to update the view
	func updateUIView(_ uiView: MKMapView, context: Context) {
		drawOverlayRing(view: uiView)
	}
	
	// the uikit <-> swiftui
	class Coordinator: NSObject, MKMapViewDelegate {
		func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
			if let overlay = overlay as? MKCircle {
				let circleRenderer = MKCircleRenderer(circle: overlay)
				circleRenderer.fillColor = .systemGreen.withAlphaComponent(0.1)
				circleRenderer.strokeColor = .systemRed
				circleRenderer.lineWidth = 2
				return circleRenderer
			}
			return MKOverlayRenderer(overlay: overlay)
		}
		
		
		func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
			
			guard annotation is MKPointAnnotation else { return nil }
			
			let identifier = "site"
			
			var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

			if annotationView == nil {
				annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
				annotationView!.canShowCallout = true
			} else {
				annotationView!.annotation = annotation
			}
			
			return annotationView
		}
	}
	
	
	// MARK: - methods
	
	// -- annotations
	func getAnnotations(view: MKMapView) {
	}
	
	// -- overlay ring
	func drawOverlayRing(view: MKMapView) {
		
		// if there has been saved data
		if let latitude  = settingsViewModel.setting.ringOverlayCenterLatitude,
		   let longitude = settingsViewModel.setting.ringOverlayCenterLongitude {

			let overlays = view.overlays

			// -- if the ring is on
			if( mapViewModel.showOverlay ) {
				
				// clear any old ones
				view.removeOverlays(overlays)
				
				// -- get the ring size from array
				let ringSize =  settingsViewModel.mapRingSizes[mapViewModel.overlaySize]
				
				// -- add the overlay image
				view.addOverlay(
					MKCircle(
						center: CLLocationCoordinate2D(
							latitude: latitude,
							longitude: longitude
						),
						
						// -- size x 1000m
						radius: CLLocationDistance(ringSize * 1000)
					)
				)
				
			} else {
				
				// -- remove all overlays
				view.removeOverlays(overlays)
			}
		}
	}
}
