//
//  MapButtonOverlay.swift
//  exposure-vic
//
//  Created by Mark Battistella on 31/8/21.
//

import SwiftUI

struct MapButtonOverlay: View {
	let image: String
	var body: some View {
		Image(systemName: image)
			.padding(10)
			.background(Color(.systemBackground))
			.cornerRadius(12)
			.shadow(radius: 8)
	}
}
