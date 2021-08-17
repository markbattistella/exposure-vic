//
//  MapTrackingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapTrackingView: View {
	
	@EnvironmentObject var locationViewModel: LocationViewModel
	
	var coordinate: CLLocationCoordinate2D? {
		locationViewModel.lastSeenLocation?.coordinate
	}
	
	var body: some View {
		
		VStack {
			VStack {
				Text( String(coordinate?.latitude ?? 0))
				Text( String(coordinate?.longitude ?? 0))
				Text( String(locationViewModel.lastSeenLocation?.altitude ?? 0))
				Text( String(locationViewModel.lastSeenLocation?.speed ?? 0))
				Text( String(locationViewModel.currentPlacemark?.country ?? ""))
				Text( String( locationViewModel.currentPlacemark?.administrativeArea ?? ""))
			}
			.padding()
		}
	}
	
	
}
