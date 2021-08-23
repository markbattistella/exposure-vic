//
//  DetailView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct DetailView: View {
	
	@Binding var isShowingDetail: Bool
	let exposure: ExposureDataRecord
	let cornerRadius: CGFloat = 12
	
	var body: some View {
		
		VStack {
			ScrollView(showsIndicators: false) {
				
				// site title
				if let place = exposure.Site_title {
					DetailInfoView(
						title: "Site name",
						message: place.sanitise()
					)
				}
				
				// street address
				if let address = exposure.Site_streetaddress {
					if let suburb = exposure.Suburb,
					   let postcode = exposure.Site_postcode {
						DetailInfoView(
							title: "Address",
							message: "\(address.sanitise()) \(suburb.sanitise()) \(postcode.sanitise())"
						)
					}
				}
				
				// exposure date time
				if let exposureDate = exposure.Exposure_date {
					if let exposureTime = exposure.Exposure_time {
						DetailInfoView(
							title: "Exposure date and time",
							message: "\(exposureDate.sanitise()) \(exposureTime.sanitise().replacingOccurrences(of: " - ", with: "-"))"
						)
					} else {
						DetailInfoView(
							title: "Exposure date",
							message: exposureDate.sanitise()
						)
					}
				}
				
				// Notes
				if let notes = exposure.Notes {
					DetailInfoView(
						title: "Exposure information",
						message: notes.sanitise()
					)
				}
				
				// advice tier
				if let adviceTitle = exposure.Advice_title {
					DetailInfoView(
						title: "Exposure tier",
						message: adviceTitle.sanitise()
					)
				}
				
				// advice instruction
				if let instruction = exposure.Advice_instruction  {
					DetailInfoView(
						title: "Health instructions",
						message: instruction.sanitise()
					)
				}
			}
			
			
			HStack {
				// close button
				Button {
					isShowingDetail = false
				} label : {
					FullWidthButton(
						title: "Close",
						backgroundColour: .red,
						textColour: .white
					)
				}
				
				// share button
				Button {
					print("sharing...")
				} label: {
					Image(systemName: "square.and.arrow.up")
						.frame(width: 50, height: 50)
						.background(Color.brandPrimary)
						.foregroundColor(.white)
						.font(.headline)
						.cornerRadius(12)
				}
			}
		}
		
		// frame options
		.padding()
		.frame(maxWidth: 320, maxHeight: 500)
		.background(Color(.systemBackground))
		.cornerRadius(cornerRadius)
		.shadow(radius: cornerRadius)
	}
	
	// share sheet
	// -- what to share
	
}