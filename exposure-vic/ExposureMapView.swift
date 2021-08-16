//
//  ExposureMapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureMapView: View {
    var body: some View {

		@StateObject var locationViewModel = LocationViewModel()
		
		var body: some View {
			switch locationViewModel.authorizationStatus {
				case .notDetermined:
					AnyView(RequestLocationView())
						.environmentObject(locationViewModel)
				case .restricted:
					ErrorView(errorText: "Location use is restricted.")
				case .denied:
					ErrorView(errorText: "The app does not have location permissions. Please enable them in settings.")
				case .authorizedAlways, .authorizedWhenInUse:
					TrackingView()
						.environmentObject(locationViewModel)
				default:
					Text("Unexpected status")
			}
		}
	}
}

struct ExposureMapView_Previews: PreviewProvider {
    static var previews: some View {
        ExposureMapView()
    }
}
