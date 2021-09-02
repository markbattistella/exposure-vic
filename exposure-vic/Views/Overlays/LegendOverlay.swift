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
		HStack(spacing: 60) {
			LegendItemOverlay(
				tierNumber: 1,
				tierColour: Color(.systemRed)
			)
			LegendItemOverlay(
				tierNumber: 2,
				tierColour: Color(.systemOrange)
			)
			LegendItemOverlay(
				tierNumber: 3,
				tierColour: Color(.systemBlue)
			)
		}
		.padding()
		.frame(maxWidth: .infinity)
		.background(Color(.systemBackground))
		.cornerRadius(12)
		.shadow(radius: 8)
	}
}

// individual items
struct LegendItemOverlay: View {
	let tierNumber: Int
	let tierColour: Color
	var body: some View {
		HStack {
			Image(systemName: "circle.fill")
				.foregroundColor(tierColour)
			Text("Tier \(tierNumber)")
				.font(.caption.bold())
		}
	}
}

