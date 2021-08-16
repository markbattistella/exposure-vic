//
//  TrackingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct TrackingView: View {
	
	@EnvironmentObject var locationViewModel: LocationViewModel
	
	var body: some View {
		VStack {
			VStack {
				PairView(
					leftText: "Latitude:",
					rightText: String(coordinate?.latitude ?? 0)
				)
				PairView(
					leftText: "Longitude:",
					rightText: String(coordinate?.longitude ?? 0)
				)
				PairView(
					leftText: "Altitude",
					rightText: String(locationViewModel.lastSeenLocation?.altitude ?? 0)
				)
				PairView(
					leftText: "Speed",
					rightText: String(locationViewModel.lastSeenLocation?.speed ?? 0)
				)
				PairView(
					leftText: "Country",
					rightText: locationViewModel.currentPlacemark?.country ?? ""
				)
				PairView(leftText: "City", rightText: locationViewModel.currentPlacemark?.administrativeArea ?? ""
				)
			}
			.padding()
		}
	}
	
	var coordinate: CLLocationCoordinate2D? {
		locationViewModel.lastSeenLocation?.coordinate
	}
}
