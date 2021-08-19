//
//  LoadingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
	
	// stub
	func makeUIView(context: Context) -> UIActivityIndicatorView {
		
		// make the spinner
		let activityIndicatorView = UIActivityIndicatorView(style: .large)
		
		// set its colour
		activityIndicatorView.color = .gray

		// begin the action
		activityIndicatorView.startAnimating()
		
		return activityIndicatorView
	}
	
	// empty
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}


struct LoadingView: View {
	var body: some View {
		
		ZStack {
			
			// set a background
			Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.1)
				.frame(width: 120, height: 120)
				.cornerRadius(16)
				
			
			// add the loading spinner
			ActivityIndicator()
		}
	}
}
