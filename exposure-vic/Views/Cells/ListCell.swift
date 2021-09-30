//
//  ListCell.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ListCell: View {
	
	let exposure: DataModel
	
	var body: some View {
		
		// build the view
		VStack(alignment: .leading, spacing: 10) {
			
			// site title
			if let place = exposure.siteTitle {
				Text(place.sanitise())
					.font(.title3)
					.fontWeight(.heavy)
					.multilineTextAlignment(.leading)
			}
			
			// street address
			if let address = exposure.siteStreetaddress {
				HStack(alignment: .center) {
					Image(systemName: "pin.fill")
						.foregroundColor(.gray)
					if let suburb = exposure.suburb,
					   let postcode = exposure.sitePostcode {
						Text("\(address.sanitise()) \(suburb.sanitise()) \(postcode.sanitise())")
					} else {
						Text(address.sanitise())
					}
				}
				.multilineTextAlignment(.leading)
			}
			
			// exposure date time
			if let exposureDate = exposure.exposureDate {
				HStack {
					Image(systemName: "calendar.badge.clock")
					Text(exposureDate.sanitise())
					if let exposureTime = exposure.exposureTime {
						Text(exposureTime.sanitise()
								.replacingOccurrences(of: " - ", with: "-")
								.replacingOccurrences(of: "- ", with: "-")
								.replacingOccurrences(of: " -", with: "-"))
							.allowsTightening(true)
							.multilineTextAlignment(.leading)
					}
				}
				.font(.body)
				.foregroundColor(.secondary)
			}
		}
		.padding(.vertical)
	}
}
