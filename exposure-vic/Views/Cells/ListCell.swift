//
//  ListCell.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ListCell: View {
	
	let exposure: ExposureDataModel
	
	var body: some View {
		
		// build the view
		VStack( alignment: .leading ) {
			
			// site title
			if let place = exposure.Site_title {
				Text(place.sanitise())
					.font(.title3)
					.fontWeight(.heavy)
					.multilineTextAlignment(.leading)
					.padding(.bottom, 1)
			}
			
			// street address
			if let address = exposure.Site_streetaddress {
				HStack {
					Image(systemName: "pin.fill")
						.foregroundColor(.gray)
					if let suburb = exposure.Suburb,
					   let postcode = exposure.Site_postcode {
						Text("\(address.sanitise()) \(suburb.sanitise()) \(postcode.sanitise())")
					} else {
						Text(address.sanitise())
					}
				}
				.padding(.bottom, 1)
			}
			
			// exposure date time
			if let exposureDate = exposure.Exposure_date {
				HStack {
					Image(systemName: "calendar.badge.clock")
					Text(exposureDate.sanitise())
					if let exposureTime = exposure.Exposure_time {
						Text(exposureTime.sanitise().replacingOccurrences(of: " - ", with: "-"))
					}
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.font(.body)
				.foregroundColor(.secondary)
			}

		}
		.padding(.top, 10)
		.padding(.bottom, 10)
	}
}
