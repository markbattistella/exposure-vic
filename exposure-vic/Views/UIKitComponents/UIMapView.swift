//
//  UIMapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 4/9/21.
//

import SwiftUI
import MapKit

struct UIMapView: UIViewRepresentable {
	
	@EnvironmentObject var mapData: MapViewModel
	
	func makeCoordinator() -> Coordinator {
		Coordinator()
	}
	
	func makeUIView(context: Context) -> MKMapView {
		let view = mapData.mapView
		view.showsUserLocation = true
		view.delegate = context.coordinator
		return view
	}
	
	func updateUIView(_ uiView: MKMapView, context: Context) {
		let overlays = uiView.overlays
		if( mapData.showOverlay ) {
			uiView.addOverlay(
				MKCircle(center: mapData.region.center, radius: 5000)
			)
		} else {
			uiView.removeOverlays(overlays)
		}
	}
	
	class Coordinator: NSObject, MKMapViewDelegate {
		func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
			if let overlay = overlay as? MKCircle {
				let circleRenderer = MKCircleRenderer(circle: overlay)
				circleRenderer.fillColor = UIColor(
					red:	0/255,
					green:	255/255,
					blue: 	0/255,
					alpha:	0.2
				)
				circleRenderer.strokeColor = .black
				circleRenderer.lineWidth = 5
				return circleRenderer
			}
			return MKOverlayRenderer(overlay: overlay)
		}
	}
}
