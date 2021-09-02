//
//  AcknowledgementsView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 23/8/21.
//

import SwiftUI

struct AcknowledgementsView: View {
	var body: some View {
		
		Form {
			FormURLRow(
				title: "Twitter",
				urlTitle: "@markbattistella",
				url: "https://twitter.com/@markbattistella")
			FormURLRow(
				title: "GitHub",
				urlTitle: "markbattistella",
				url: "https://github.com/markbattistella")
			
			Text("Omnis inventore vel ut mollitia quos necessitatibus ipsum esse. Et labore tempore dolores qui magnam ut illo. Illum mollitia corrupti rerum autem voluptatum hic. Sint sit laudantium neque. Neque nihil ipsa laboriosam consequatur. Non qui blanditiis voluptas et.")
		}
	}
}
