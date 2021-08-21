//
//  ListCell.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ListCell: View {
	
	let exposure: ExposureDataRecord

	var body: some View {

		// build the view
		VStack( alignment: .leading ) {

			Text( exposure.Suburb ?? "NIL" )
				.font(.title2)
				.bold()
				.frame(maxWidth: 350, alignment: .leading)

			// site title
			Text( exposure.Site_title ?? "NIL")
				.font(.title3)
				.bold()
				.padding(.bottom, 1)
						
			// if there is an address
			if let cleanSiteStreetAddress = exposure.Site_streetaddress {
				Text( cleanSiteStreetAddress )
					.font(.title3)
					.padding(.bottom, 1)
			}
		}
	}
}
