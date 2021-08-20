//
//  MapViewRequest.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct MapViewRequest: View {

	@ObservedObject var exposureMapViewModel: ExposureMapViewModel
	
	var body: some View {
		
		VStack {
			Image(systemName: "location.fill")
				.resizable()
				.frame(width: 68, height: 68)

			Text("Allow location to see any exposure sites near you")
				.padding()
				.font(.headline)

			Button(action: {
				exposureMapViewModel.requestPermission()
			}, label: {
				Text("Allow location")
			})
			.padding(10)
			.frame(width: 300, height: 50)
			.foregroundColor(.white)
			.background(Color.green)
			.cornerRadius(12)
		}
		.foregroundColor(.secondary)
		.frame(width: 300)
	}
}
