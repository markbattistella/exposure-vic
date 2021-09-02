//
//  MapExposureSite.swift
//  exposure-vic
//
//  Created by Mark Battistella on 31/8/21.
//

import SwiftUI

// map pin view
struct MapExposureSite: View {
	let level: Int
	var body: some View {
		Image(systemName: "circle.fill")
			.padding(5)
			.foregroundColor(
				level == 1 ? .red :
				level == 2 ? .orange :
				level == 3 ? .blue :
				.gray
			)
	}
}
