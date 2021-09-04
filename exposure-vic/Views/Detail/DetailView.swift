//
//  DetailView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct DetailView: View {
	
	@Binding var isShowingDetail: Bool
	let exposure: DataModel
	
	var body: some View {
		
		VStack {
			ScrollView(showsIndicators: false) {
				
				// site title
				if let place = exposure.siteTitle {
					DetailInfoView(
						title: "Site name",
						message: place.sanitise()
					)
				}
				
				// street address
				if let address = exposure.siteStreetaddress {
					if let suburb = exposure.suburb,
					   let postcode = exposure.sitePostcode {
						DetailInfoView(
							title: "Address",
							message: "\(address.sanitise()) \(suburb.sanitise()) \(postcode.sanitise())"
						)
					}
				}
				
				// exposure date time
				if let exposureDate = exposure.exposureDate {
					if let exposureTime = exposure.exposureTime {
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
				if let notes = exposure.notes {
					DetailInfoView(
						title: "Exposure information",
						message: notes.sanitise()
					)
				}
				
				// advice tier
				if let adviceTitle = exposure.adviceTitle {
					DetailInfoView(
						title: "Exposure tier",
						message: adviceTitle.sanitise()
					)
				}
				
				// advice instruction
				if let instruction = exposure.adviceInstruction  {
					DetailInfoView(
						title: "Health instructions",
						message: instruction.sanitise()
					)
				}
				
				// added date time
				if let addedDate = exposure.addedDate {
					if let addedTime = exposure.addedTime {
						DetailInfoView(
							title: "Added date and time",
							message: "\(addedDate.sanitise()) \(addedTime.sanitise().replacingOccurrences(of: " - ", with: "-"))"
						)
					} else {
						DetailInfoView(
							title: "Added date and time",
							message: addedDate.sanitise()
						)
					}
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
				
				// error button
				Button {
					if let url = URL(string: "https://github.com/markbattistella/exposure-vic-api/issues") {
						UIApplication.shared.open(url)
					}
				} label : {
					Image(systemName: "exclamationmark.bubble")
						.frame(width: 50, height: 50)
						.background(Color(.systemBlue))
						.foregroundColor(.white)
						.cornerRadius(12)
				}
			}
		}
		
		
		// frame options
		.padding()
		.frame(maxWidth: 320, maxHeight: 500)
		.background(Color(.systemBackground))

		.padding(.top, 20)
		.border(width: 20, edges: [.top], color: exposure.exposureColour)

		.cornerRadius(12)
		.shadow(radius: 12)
	}
}
