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
		Coordinator(self)
	}
	
	// first build of view
	func makeUIView(context: Context) -> MKMapView {
		let view = mapViewModel.mapView
		view.showsUserLocation = true
		view.isRotateEnabled = false
		view.isPitchEnabled = false
		view.delegate = context.coordinator
		return view
	}
	
	// to update the view
	func updateUIView(_ uiView: MKMapView, context: Context) {
		drawOverlayRing(view: uiView)
		getAnnotations(view: uiView)
	}
	
	// the uikit <-> swiftui
	class Coordinator: NSObject, MKMapViewDelegate {
		var parent: UIMapView
		
		init(_ parent: UIMapView) {
			self.parent = parent
		}

		// overlay
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
		
		// annotation
		func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
			
			// init the annotation
			var annotationView = MKMarkerAnnotationView()
			
			// show user locations itself
			guard !(annotation is MKUserLocation) else { return nil }
			
			// custom annotation
			guard let annotation = annotation as? ExposureAnnotation else { return nil }
			
			// changable variables
			var identifier: String
			var colour: UIColor
			
			switch annotation.type {
				case .tier1:
					identifier = "Tier 1"
					colour = .systemRed
				case .tier2:
					identifier = "Tier 2"
					colour = .systemOrange
				case .tier3:
					identifier = "Tier 3"
					colour = .systemBlue
				default:
					identifier = "Tier 0"
					colour = .systemGray
			}
			
			if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
				annotationView = dequedView
			} else{
				annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
			}

			// extra customisation
			annotationView.canShowCallout = false
			annotationView.animatesWhenAdded = false
			annotationView.titleVisibility = .hidden
			annotationView.subtitleVisibility = .hidden

			// -- image type
			annotationView.markerTintColor = .clear
			annotationView.glyphImage = UIImage(systemName: "circle.fill")
			annotationView.glyphTintColor = colour
			
			annotationView.layer.shadowColor = UIColor.black.cgColor
			annotationView.layer.shadowOffset = CGSize(width: 0, height: 0)
			annotationView.layer.shadowOpacity = 0.1
			annotationView.layer.shadowRadius = 5
			annotationView.clipsToBounds = false
			
			// send it back
			return annotationView
		}
		
		// get the tapped annotation
		func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
			
			// if not tapping the user location
			if !(view.annotation is MKUserLocation) {
				
				// let them know its our custom pin
				let annotation = view.annotation as? ExposureAnnotation
				
				// -- set up all the info for display
				parent.exposureViewModel.selectedExposure = annotation?.exposure
				parent.exposureViewModel.isShowingDetail = true
			}
		}
	}
	
	
	// MARK: - methods
	
	// -- annotations
	private func getAnnotations(view: MKMapView) {
		
		// -- remove all the old annotations
		view.removeAnnotations(view.annotations)
		
		for exposure in exposureViewModel.exposures {
			
			// unwrap
			guard let title = exposure.siteTitle else { return }
			guard let latitude = exposure.latitude else { return }
			guard let longitude = exposure.longitude else { return }
			
			let annotation = ExposureAnnotation(
				latitude,
				longitude,
				title: title,
				type: exposure.exposureLevel,
				exposure: exposure
			)
			
			// -- add the annotation
			view.addAnnotation(annotation)
		}
		
	}
	
	// -- overlay ring
	private func drawOverlayRing(view: MKMapView) {

		// if there has been saved data
		if let latitude  = settingsViewModel.setting.ringOverlayCenterLatitude,
		   let longitude = settingsViewModel.setting.ringOverlayCenterLongitude {
			
			let overlays = view.overlays
			
			// -- if the ring is on
			if( settingsViewModel.setting.showRingOverlay ) {
				
				// clear any old ones
				view.removeOverlays(overlays)
				
				// -- get the ring size from array
				let ringSize = settingsViewModel.mapRingSizes[
					settingsViewModel.setting.mapRingSize
				]
				
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
