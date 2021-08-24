//
//  ModelData.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI
import CoreLocation

final class ModelData: ObservableObject {
	
	@Published var exposures: [ExposureDataRecord] = []
	@Published var alertItem: AlertItem?
	@Published var lastUpdated: String = ""
	@Published var isLoading = false
	@Published var isShowingDetail = false
	@Published var selectedExposure: ExposureDataRecord?
	@Published var isRefreshing = false
	@Published var storedCoordirates = [ExposureDataRecord.ID: CLLocationCoordinate2D]()
	
	// get the data
	func getExposureData() {
		
		// activate the loading view
		isLoading = true
		
		// make the network call
		NetworkManager.shared.getExposureSites { result in
			
			// main thread
			DispatchQueue.main.async {

				// hide the loading view
				self.isLoading = false

				// switch on the output
				switch result {
					
					// success - update the exposures
					case .success(let exposures):
						
						// add the exposures
						self.exposures = exposures
						
						// get the date
						let date = Date()
						let dateFormatter = DateFormatter()

						// set the update date time
						dateFormatter.dateFormat = "dd/MM HH:mm a"
						self.lastUpdated = dateFormatter.string(from: date)

					// failure - alert
					case .failure(let error):
						
						// report failure
						self.lastUpdated = "Unknown"
						
						// switch on the errors
						switch error {
							
							// present the correct alert
							case .invalidData:
								self.alertItem = AlertContext.invalidData

							case .invalidURL:
								self.alertItem = AlertContext.invalidURL

							case .invalidResponse:
								self.alertItem = AlertContext.invalidResponse

							case .unableToComplete:
								self.alertItem = AlertContext.unableToComplete
						}
				}
			}
		}
	}
	
	// get the co-ordinates now
	func getCoordinates(_ location: ExposureDataRecord) -> CLLocationCoordinate2D {
		if let coordirates = storedCoordirates[location.id] {
			return coordirates
		}
		if let address = location.Site_streetaddress,
		   let suburb = location.Suburb,
		   let postcode = location.Site_postcode,
		   let state = location.Site_state {
			
			CLGeocoder().geocodeAddressString("\(address) \(suburb) \(state) \(postcode)") { (placemark, error) in
				
				// errors
				if let error = error as? CLError {
					switch error.code {
						case .locationUnknown:
							print("locationUnknown: location manager was unable to obtain a location value right now.")
						case .denied:
							print("denied: user denied access to the location service.")
						case .promptDeclined:
							print("promptDeclined: user didn’t grant the requested temporary authorization.")
						case .network:
							print("network: network was unavailable or a network error occurred.")
						case .headingFailure:
							print("headingFailure: heading could not be determined.")
						case .rangingUnavailable:
							print("rangingUnavailable: ranging is disabled.")
						case .rangingFailure:
							print("rangingFailure: a general ranging error occurred.")
						default : break
					}
				}
				
				self.storedCoordirates[location.id] = placemark?.first?.location?.coordinate
			}
		}
		return CLLocationCoordinate2D()
	}
}
