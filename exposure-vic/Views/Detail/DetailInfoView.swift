//
//  DetailInfoView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 21/8/21.
//

import SwiftUI

struct DetailInfoView: View {

	var title: String
	var message: String
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.font(.title3)
				.fontWeight(.heavy)
				.multilineTextAlignment(.leading)
			Text(message)
				.multilineTextAlignment(.leading)
				.font(.body)
		}
		.padding(.bottom, 10)
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}
