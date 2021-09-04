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
			Color(.black)
				.opacity(0.2)
				.frame(width: 120, height: 120)
				.cornerRadius(12)
			
			// add the loading spinner
			ActivityIndicator()
		}
	}
}
