//
//  MapViewRequest.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct MapViewRequest: View {

	@ObservedObject var mapViewModel: MapViewModel
	
	var body: some View {
		
		VStack {
			Image(systemName: "location.fill")
				.resizable()
				.frame(width: 68, height: 68)

			Text("Allow location to see any exposure sites near you")
				.padding()
				.font(.headline)
				.multilineTextAlignment(.center)


			Button(action: {
				mapViewModel.requestPermission()
			}, label: {
				FullWidthButton(title: "Allow location", backgroundColour: .green, textColour: .white)
					.padding(10)
			})
		}
		.foregroundColor(.secondary)
		.frame(width: 300)
	}
}
