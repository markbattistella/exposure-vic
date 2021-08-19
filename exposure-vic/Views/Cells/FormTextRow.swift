//
//  FormInfoRow.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct FormTextRow: View {
	
	let title: String
	let info: String
	
	var body: some View {
		HStack {
			Text(title)
			Spacer()
			Text(info)
				.foregroundColor(.secondary)
		}
	}
}
