//
//  MapSwitcherView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct MapSwitcherView: View {
	
	@StateObject var mapViewModel = MapViewModel()
	
	var body: some View {

		// find out what weve been permitted
		switch mapViewModel.authorizationStatus {
			
			// success: user has allowed location use
			case .authorizedAlways,
				 .authorizedWhenInUse:
				MapView()
				
			// failure: user denied permission
			case .denied:
				MapErrorView(errorText: "The app does not have location permissions. Please enable it in the settings app.")
				
			// unsure
			case .notDetermined:
				MapRequestView(mapViewModel: mapViewModel)

			// location use is not on
			case .restricted:
				MapErrorView(errorText: "Location use is restricted.")

			// all other
			default:
				Text("Unexpected status")
		}
	}
}
