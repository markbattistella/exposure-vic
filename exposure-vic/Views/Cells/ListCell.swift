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
			
			// site title
			if let place = exposure.Site_title {
				Text(place)
					.font(.title3)
					.fontWeight(.heavy)
					.multilineTextAlignment(.leading)
			}
			
			// street address
			if let address = exposure.Site_streetaddress {
				if let suburb = exposure.Suburb,
				   let postcode = exposure.Site_postcode {
					Text("\(address.replacingOccurrences(of: "\t", with: "")) \(suburb) \(postcode)")
				} else {
					Text("\(address.replacingOccurrences(of: "\t", with: ""))")
				}
			}
			
			// exposure date time
			HStack {
				if let exposureDate = exposure.Exposure_date {
					Text(exposureDate)
				}
				if let exposureTime = exposure.Exposure_time {
					Text(exposureTime.replacingOccurrences(of: " - ", with: "-"))
				}
			}
			.font(.body)
			.foregroundColor(.secondary)
		}
		.padding(.top, 10)
		.padding(.bottom, 10)
	}
}
