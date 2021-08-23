//
//  LoadingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 20/8/21.
//

import SwiftUI

struct LoadingOverlay: View {
	var body: some View {
		ZStack {
			Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.1)
				.frame(width: 120, height: 120)
				.cornerRadius(16)
			
			// add the loading spinner
			ActivityIndicator()
		}
	}
}
