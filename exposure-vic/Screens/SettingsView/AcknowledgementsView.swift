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
			
			Section(
				header: Text("Data sources"),
				footer: Text("")
			) {
				FormURLRow(
					title: "Exposure sites",
					urlTitle: "DataVIC",
					url: "https://discover.data.vic.gov.au/dataset/all-victorian-sars-cov-2-covid-19-current-exposure-sites")
				FormURLRow(
					title: "Geocoding",
					urlTitle: "PositionStack",
					url: "https://positionstack.com")
				FormURLRow(
					title: "Parsed data",
					urlTitle: "API repo",
					url: "https://github.com/markbattistella/exposure-vic-api")
			}
			
			Section(header: Text("Me")) {
				FormURLRow(
					title: "Twitter",
					urlTitle: "@markbattistella",
					url: "https://twitter.com/@markbattistella")
				FormURLRow(
					title: "GitHub",
					urlTitle: "markbattistella",
					url: "https://github.com/markbattistella")
			}
			
		}
		.navigationBarTitle("Acknowledgements")
	}
}
