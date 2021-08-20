//
//  ActivityIndicator.swift
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
