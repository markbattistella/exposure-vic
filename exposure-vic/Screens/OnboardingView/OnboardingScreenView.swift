//
//  OnboardingScreenView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 22/8/21.
//

import SwiftUI

struct OnboardingScreenView: View {
	
	var image: String
	var title: String
	var description: String
	var backgroundColour: Color
	
	var body: some View {
		VStack(spacing: 20) {
			Spacer(minLength: 60)
			
			// image
			Image(image)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(maxWidth: .infinity, maxHeight: 300)
			
			// title
			Text(title)
				.font(.title)
				.fontWeight(.heavy)
			
			// description
			Text(description)
				.font(.title3)
				.padding()
				.multilineTextAlignment(.center)
			
			Spacer(minLength: 120)
		}
		.foregroundColor(.white)
		.background(backgroundColour)
		.edgesIgnoringSafeArea(.all)
	}
}
