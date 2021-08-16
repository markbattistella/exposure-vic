//
//  ErrorView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI

struct ErrorView: View {
	var errorText: String
	
	var body: some View {
		VStack {
			Image(systemName: "xmark.octagon")
				.resizable()
				.frame(width: 100, height: 100, alignment: .center)
			Text(errorText)
		}
		.padding()
		.foregroundColor(.white)
		.background(Color.red)
		.clipShape(RoundedRectangle(cornerRadius: 12))
	}
}
