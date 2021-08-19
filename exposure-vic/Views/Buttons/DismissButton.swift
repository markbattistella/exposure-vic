//
//  DismissButton.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct DismissButton: View {

	let title: String
	let image: String
	
	var body: some View {

		Label(title, systemImage: image)
			.padding(12)
			.font(.subheadline)
			.background(Color(.systemBackground))
			.cornerRadius(8)
			.padding(.bottom, 10)
			.shadow(radius: 10)
	}
}
