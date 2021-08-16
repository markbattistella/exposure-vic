//
//  PairView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct PairView: View {
	let leftText: String
	let rightText: String
	
	var body: some View {
		HStack {
			Text(leftText)
			Spacer()
			Text(rightText)
		}
	}
}
