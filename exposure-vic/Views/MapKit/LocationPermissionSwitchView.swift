//
//  LocationPermissionSwitchView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct LocationPermissionSwitchView: View {
	
	@StateObject var locationViewModel = ExposureMapViewModel()
	
	var body: some View {

		// find out what weve been permitted
		switch locationViewModel.authorizationStatus {
			
			// success: user has allowed location use
			case .authorizedAlways,
				 .authorizedWhenInUse:
				ExposureMapView(locationViewModel: locationViewModel)
				
			// failure: user denied permission
			case .denied:
				LocationPermissionErrorView(errorText: "The app does not have location permissions. Please enable it in the settings app.")
				
			// unsure
			case .notDetermined:
				LocationPermissionRequestView(locationViewModel: locationViewModel)

			// location use is not on
			case .restricted:
				LocationPermissionErrorView(errorText: "Location use is restricted.")

			// all other
			default:
				Text("Unexpected status")
		}
	}
}
