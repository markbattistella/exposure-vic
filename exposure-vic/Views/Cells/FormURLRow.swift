//
//  FormURLRow.swift
//  exposure-vic
//
//  Created by Mark Battistella on 20/8/21.
//

import SwiftUI

struct FormURLRow: View {
	
	let title: String
	let urlTitle: String
	let url: String
	
	var body: some View {
		if let cleanUrl = URL(string: url) {
			HStack {
				Text(title)
				Spacer()
				Link(urlTitle, destination: cleanUrl)
			}
		}
	}
}
