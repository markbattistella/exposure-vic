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
							title: "Added date",
							message: addedDate.sanitise()
						)
					}
				}
			
				// report wrong info
				Button {
					
					let url = "mailto:exposurevic@outlook.com.au"

					// unwrap the url
					guard let url = URL(string: url) else { return }

					//
					guard var components = URLComponents(
							url: url, resolvingAgainstBaseURL: false
					) else { return }
					
					components.queryItems = [
						URLQueryItem(
							name: "subject",
							value: "AUTO: [\(exposure.id)] - \(exposure.siteTitle ?? "")"
						),
						
						URLQueryItem(
							name: "body",
							value: "Hi! I found a problem with one of the sites. The problem is: "
						)
					]
					
					// get the full url with parameters
					guard let emailURL = components.url else { return }

					// open the email client
					UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)

				} label: {
					Text("See something wrong? Report it here")
						.foregroundColor(Color(.systemGray3))
						.font(.caption)
						.padding(.vertical, 5)
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
					shareButton(data: exposure)
				} label : {
					Image(systemName: "square.and.arrow.up")
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
	
	// show share
	private func shareButton(data: DataModel) {
		
		// blank the array
		var shareItems: [String] = []
		
		
		// unwrap all the items
		if let place = data.siteTitle { shareItems.append("Site name: \(place)") }
		if let address = data.siteStreetaddress {
			if let suburb = data.suburb,
			   let postcode = data.sitePostcode {
				shareItems.append("\n\nSite location: \(address) \(suburb) \(postcode)")
			}
		}
		if let exposureDate = data.exposureDate {
			if let exposureTime = data.exposureTime {
				shareItems.append("\n\nExposure date and time: \(exposureDate) \(exposureTime)")
			} else {
				shareItems.append("\n\nExposure date: \(exposureDate)")
			}
		}
		if let notes = data.notes { shareItems.append("\n\nExposure info: \(notes)") }
		if let adviceTitle = data.adviceTitle {
			shareItems.append("\n\nExposure tier: \(adviceTitle)")
		}
		if let instruction = data.adviceInstruction {
			shareItems.append("\n\nHealth instruction: \(instruction)")
		}

		// add them to the share item
		let activityController = UIActivityViewController(
			activityItems: shareItems,
			applicationActivities: nil
		)
		
		// show the window
		UIApplication.shared.windows.first?.rootViewController!.present(
			activityController,
			animated: true,
			completion: nil
		)
	}
}
