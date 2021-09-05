//
//  MapSwitcherView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct MapSwitcherView: View {
	
	@StateObject var mapViewModel = MapViewModel()
	@StateObject var exposureViewModel = ExposureViewModel()
	@StateObject var settingsViewModel = SettingsViewModel()

	var body: some View {

		// find out what weve been permitted
		switch mapViewModel.authorizationStatus {
			
			// success: user has allowed location use
			case .authorizedAlways,
				 .authorizedWhenInUse:
				MapView()
					// add model data to the environment
					// -- all child views can access it
					.environmentObject(exposureViewModel)
					.environmentObject(settingsViewModel)

				
			// failure: user denied permission
			case .denied:
				MapErrorView(errorText: "The app does not have location permissions. Please enable it in the settings app.")
				
			// unsure
			case .notDetermined:
				MapRequestView()

			// location use is not on
			case .restricted:
				MapErrorView(errorText: "Location use is restricted.")

			// all other
			default:
				Text("Unexpected status")
		}
	}
}
