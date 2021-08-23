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
		
		ZStack {
			// show the map
			Map(
				coordinateRegion: $mapViewModel.region,
				interactionModes: .all,
				showsUserLocation: true,
				annotationItems: modelData.exposures,
				annotationContent: { location in
					MapPin(coordinate: modelData.getCoordinates(location), tint: .red)
				}
			)
			.edgesIgnoringSafeArea(.all)
						
			// re-center location after pan and zoom
			VStack {
				Spacer()
				HStack {
					Spacer()
					
					Button {
						modelData.getExposureData()
					} label: {
						MapOverlay(image: "arrow.down.circle")
					}.padding(20)
					
					Button {
						mapViewModel.recentreLocation()
					} label: {
						MapOverlay(image: "target")
					}.padding(20)
				}
			}
		}
		.onAppear {
			modelData.getExposureData()
			
			print(modelData.storedCoordirates)
			
//			for i in modelData.exposures {
//				print(modelData.getCoordinates(i))
//			}
		}
	}
}
