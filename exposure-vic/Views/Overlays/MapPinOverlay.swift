//
//  MapPinOverlay.swift
//  exposure-vic
//
//  Created by Mark Battistella on 31/8/21.
//

import SwiftUI

// map pin view
struct MapPin: View {
	let level: Int
	var body: some View {
		Image(systemName: "\(level).circle.fill")
			.background(
				Color.init(
					red: 0,
					green: 0,
					blue: 0,
					opacity: 0.7
				)
			)
			.foregroundColor(
				level == 1 ? .red :
					level == 2 ? .yellow :
					level == 3 ? .purple :
					.gray
			)
			.clipShape(Circle())
		
	}
}
