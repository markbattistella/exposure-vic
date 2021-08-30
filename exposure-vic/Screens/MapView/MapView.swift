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
	
	var body: some View {
		
		// show the map
		Map(
			coordinateRegion: $mapViewModel.region,
			interactionModes: .all,
			showsUserLocation: true,
			annotationItems: modelData.exposures,
			annotationContent: { exposure in
				MapAnnotation(
					coordinate: exposure.coordinate,
					content: {
						Image(systemName: "pin.circle.fill")
							.foregroundColor(.red)
					}
				)

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
		
		// when the view is activated
		// -- insert the reload from network
		.onAppear {
			modelData.getExposureData()
		}
	}
}
