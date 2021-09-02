//
//  MapExposureSite.swift
//  exposure-vic
//
//  Created by Mark Battistella on 31/8/21.
//

import SwiftUI

// map pin view
struct MapPinOverlay: View {
	let tint: Color
	var body: some View {
		Image(systemName: "circle.fill")
			.padding(5)
			.foregroundColor(tint)
			.shadow(radius: 1)
	}
}
