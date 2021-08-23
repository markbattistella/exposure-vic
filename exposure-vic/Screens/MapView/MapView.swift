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
	@StateObject var mapViewModel = MapViewModel()
	
	var body: some View {
		
		ZStack {
			// show the map
			// -- this works without any annotations :(
			Map(
				coordinateRegion: $mapViewModel.region,
				showsUserLocation: true
			)
			.edgesIgnoringSafeArea(.all)
						
			// re-center location after pan and zoom
			VStack {
				Spacer()
				HStack {
					Spacer()
					Button {
						mapViewModel.recentreLocation()
					} label: {
						OverlayButton(image: "target")
					}.padding(20)
				}
			}
		}
	}
}
