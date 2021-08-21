//
//  FullWidthButton.swift
//  exposure-vic
//
//  Created by Mark Battistella on 21/8/21.
//

import SwiftUI

struct FullWidthButton: View {
	
	var title: String
	var backgroundColour: Color
	var textColour: Color
	
	var body: some View {
		Text(title)
			.frame(maxWidth: .infinity, minHeight: 50)
			.background(backgroundColour)
			.foregroundColor(textColour)
			.font(.headline)
			.cornerRadius(12)
	}
}
