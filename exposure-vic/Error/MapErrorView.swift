//
//  ErrorView.swift
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
		}
		.foregroundColor(.secondary)
		.frame(width: 300)
		
	}
}

struct MapErrorView_Previews: PreviewProvider {
	static var previews: some View {
		MapErrorView(errorText: "The app does not have location permissions. Please enable them in the settings app.")
	}
}
