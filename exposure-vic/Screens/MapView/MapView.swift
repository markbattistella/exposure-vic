//
//  MapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	@EnvironmentObject var modelData: ModelData
	@EnvironmentObject var settingsViewModel: SettingsViewModel
	
	@StateObject var mapViewModel = MapViewModel()
	
	
	let dummyPins = [
		ExposureCoordinates(latitude: -37.710765, longitude: 144.925904),
		ExposureCoordinates(latitude: -37.715984, longitude: 144.910316),
		ExposureCoordinates(latitude: -37.702431, longitude: 144.899462)
	]
	
	
	var body: some View {
		
		ZStack {
			// show the map
			Map(
				coordinateRegion: $mapViewModel.region,
				interactionModes: .all,
				showsUserLocation: true,
				annotationItems: dummyPins,
				annotationContent: { location in
					MapAnnotation(coordinate: location.coordinate) {
						Image(systemName: "pin.circle.fill").foregroundColor(.red)
							.onTapGesture {
								//
								print("Tapped")
							}
					}
				}
			)
			.edgesIgnoringSafeArea(.all)
			
			// re-center location after pan and zoom
			.overlay (
				Button {
					mapViewModel.recentreLocation()
				} label: {
					MapOverlay(image: "target")
				}
				.padding(.bottom, 20), alignment: .bottomTrailing
			)
		}
	}
}
