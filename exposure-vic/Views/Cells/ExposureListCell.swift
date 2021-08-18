//
//  ExposureListCell.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureListCell: View {
	
	let exposure: ExposureModelRecord

	var body: some View {

		// build the view
		VStack( alignment: .leading ) {
			
			Text( exposure.Suburb )
				.font(.title2)
				.bold()
				.frame(maxWidth: 350, alignment: .leading)

			// site title
			Text( exposure.Site_title )
				.font(.title3)
				.bold()
				.padding(.bottom, 1)
			
			
			// if there is an address
			if let cleanSiteStreetAddress = exposure.Site_streetaddress {
				Text( cleanSiteStreetAddress )
					.font(.title3)
					.padding(.bottom, 1)
			}
			
			// date time of exposure
			Text( exposure.Exposure_date + " " + exposure.Exposure_time)
				.font(.subheadline)
				.padding(.bottom, 1)
			
//			Rectangle()
//				.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 1)
			
			// tier notice
			Text( exposure.Advice_title )
				.font(.body)
				.padding(.bottom, 1)
			
			// advice info
//			Text( exposure.Advice_instruction )
//				.font(.body)
//				.padding(.bottom, 1)
			
			//
//			Text( exposure.Notes )
//				.font(.caption)
//				.italic()
			
		}
	}
}

struct ExposureListCell_Previews: PreviewProvider {
    static var previews: some View {
		ExposureListCell(exposure: MockData.sampleExposureRecord)
    }
}
