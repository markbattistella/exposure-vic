//
//  MapViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct MapViewModel: View {

	@StateObject var locationViewModel = LocationViewModel()

	var body: some View {
		
		// find out what weve been permitted
		switch locationViewModel.authorizationStatus {
			
			// unsure
			case .notDetermined:
				AnyView(RequestLocationView())
					.environmentObject(locationViewModel)
				
			// location use is not on
			case .restricted:
				MapErrorView(errorText: "Location use is restricted.")
				
			// user denied permission
			case .denied:
				MapErrorView(errorText: "The app does not have location permissions. Please enable it in the settings app.")
				
			// user has permissed location in use
			case .authorizedAlways, .authorizedWhenInUse:
				TrackingView()
					.environmentObject(locationViewModel)
				
			// all other
			default:
				Text("Unexpected status")
		}
		
	}
}
