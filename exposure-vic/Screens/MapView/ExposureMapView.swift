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
			
			// re-center location after pan and zoom
			VStack {
				Spacer()
				Button {
					locationViewModel.recentreLocation()
				} label: {
					DismissButton(title: "Re-centre", image: "target")
				}
			}
		}
	}
}
