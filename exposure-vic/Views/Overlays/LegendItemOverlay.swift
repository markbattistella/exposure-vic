//
//  LegendItemOverlay.swift
//  exposure-vic
//
//  Created by Mark Battistella on 4/9/21.
//

import SwiftUI

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
