//
//  LegendOverlay.swift
//  exposure-vic
//
//  Created by Mark Battistella on 31/8/21.
//

import SwiftUI

// lgend
struct LegendOverlay: View {
	var body: some View {
		HStack {
			LegendItemOverlay(
				tierNumber: 1,
				tierColour: Color(.systemRed)
			)
			
			Spacer()
			
			LegendItemOverlay(
				tierNumber: 2,
				tierColour: Color(.systemOrange)
			)
			
			Spacer()
			
			LegendItemOverlay(
				tierNumber: 3,
				tierColour: Color(.systemBlue)
			)
		}
		.padding()
		.frame(maxWidth: .infinity, maxHeight: 50)
		.background(Color(.systemBackground))
		.cornerRadius(12)
		.shadow(radius: 8)
	}
}
