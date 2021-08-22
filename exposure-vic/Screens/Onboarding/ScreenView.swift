//
//  ScreenView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 22/8/21.
//

import SwiftUI

struct ScreenView: View {
	
	var image: String
	var title: String
	var description: String
	var backgroundColour: Color
	
	var body: some View {
		VStack(spacing: 20) {
			Spacer()
			
			// image
			Image(image)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 400)
			
			// title
			Text(title)
				.font(.title)
				.fontWeight(.heavy)
			
			// description
			Text(description)
				.font(.title3)
			
			Spacer(minLength: 120)
		}
		.foregroundColor(.primary)
		.padding(.bottom, 20)
		.background(backgroundColour)
		.edgesIgnoringSafeArea(.all)
	}
}
