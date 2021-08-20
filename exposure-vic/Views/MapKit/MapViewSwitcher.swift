//
//  MapViewSwitcher.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct MapViewSwitcher: View {
	
	@StateObject var exposureMapViewModel = ExposureMapViewModel()
	
	var body: some View {

		// find out what weve been permitted
		switch exposureMapViewModel.authorizationStatus {
			
			// success: user has allowed location use
			case .authorizedAlways,
				 .authorizedWhenInUse:
				ExposureMapView(locationViewModel: exposureMapViewModel)
				
			// failure: user denied permission
			case .denied:
				MapViewError(errorText: "The app does not have location permissions. Please enable it in the settings app.")
				
			// unsure
			case .notDetermined:
				MapViewRequest(exposureMapViewModel: exposureMapViewModel)

			// location use is not on
			case .restricted:
				MapViewError(errorText: "Location use is restricted.")

			// all other
			default:
				Text("Unexpected status")
		}
	}
}
