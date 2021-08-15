//
//  ListItemView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 15/8/21.
//

import SwiftUI

struct ListItemView: View {
	
	//
	var tierValue: String
	var suburb: String
	var siteTitle: String
	var siteStreetAddress: String?
	var exposureDate: String
	var exposureTime: String
	var notes: String
	var adviceTitle: String
	var adviceInstruction: String

	//
	var body: some View {
		
		VStack( alignment: .leading ) {
			
			HStack {
				// tier value
				Image(systemName: "\(tierValue).circle.fill")
				
				// suburb
				Text( suburb )
					.font(.title2)
					.bold()
					.frame(maxWidth: 350, alignment: .leading)
			}
			.padding(.bottom, 5)
			
			// site title
			Text( siteTitle )
				.font(.title3)
				.bold()
				.padding(.bottom, 1)

			
			// if there is an address
			if let cleanSiteStreetAddress = siteStreetAddress {
				Text( cleanSiteStreetAddress )
					.font(.title3)
					.padding(.bottom, 1)
			}
			
			// date time of exposure
			Text( exposureDate + " " + exposureTime)
				.font(.subheadline)
				.padding(.bottom, 1)

			Rectangle()
				.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 1)
			
			// tier notice
			Text( adviceTitle )
				.font(.body)
				.padding(.bottom, 1)

			// advice info
			Text( adviceInstruction )
				.font(.body)
				.padding(.bottom, 1)

			//
			Text( notes )
				.font(.caption)
				.italic()

		}
        
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(
			tierValue: "2",
			suburb: "Carlton",
			siteTitle: "480 Lygon Street Residential Tower",
			siteStreetAddress: "480 Lygon Street",
			exposureDate: "08/08/2021",
			exposureTime: "12:00am - 11:59pm",
			notes: "Case attended venue. Some individuals will be Tier 1 contacts required to quarantine for 14 days and the Department will contact them directly with this advice.",
			adviceTitle: "Tier 2 - Get tested urgently and isolate until you have a negative result",
			adviceInstruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear."
		)
    }
}
