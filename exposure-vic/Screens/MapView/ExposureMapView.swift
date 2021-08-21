//
//  MapTrackingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit

struct ExposureMapView: View {
	
	//
	@StateObject var locationViewModel = ExposureMapViewModel()
	@StateObject var exposureModelData = ExposureModelData()
	
	//
	var body: some View {
		
		ZStack {
			// show the map
			// -- this works without any annotations :(
			Map(
				coordinateRegion: $locationViewModel.region,
				showsUserLocation: true
			)
			.edgesIgnoringSafeArea(.all)
			
			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				exposureModelData.getExposureData()
			}
			
			// re-center location after pan and zoom
			VStack {
				Spacer()
				HStack {
					Spacer()
					Button {
						locationViewModel.recentreLocation()
					} label: {
						OverlayButton(image: "target")
					}.padding(20)
				}
			}
		}
	}
}
