//
//  MapErrorView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct MapErrorView: View {
	
	var errorText: String
	
	var body: some View {
		VStack {
			Image(systemName: "location.slash.fill")
				.resizable()
				.frame(width: 68, height: 68)

			Text(errorText)
				.padding()
				.font(.headline)
				.multilineTextAlignment(.center)
			
			// send user to settings
			Button(action: {
				UIApplication.shared.open(
					URL(string: UIApplication.openSettingsURLString)!
				)
			}, label: {
				FullWidthButton(title: "Go to settings", backgroundColour: .red, textColour: .white)
			})
			.padding(10)
			.frame(width: 300, height: 50)
			.foregroundColor(.white)
			.background(Color.red)
			.cornerRadius(12)
		}
		.foregroundColor(.secondary)
		.frame(width: 300)
	}
}
