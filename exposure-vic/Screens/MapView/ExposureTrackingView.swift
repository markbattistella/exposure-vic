//
//  MapTrackingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit

struct ExposureTrackingView: View {

	//
	@EnvironmentObject var locationViewModel: ExposureMapViewModel

	//
	var body: some View {

		// show the map
		Map(
			coordinateRegion: $locationViewModel.region,
			showsUserLocation: true
		)
		.edgesIgnoringSafeArea(.all)
	}
}
