//
//  MapViewError.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct MapViewError: View {
	
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
