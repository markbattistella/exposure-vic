//
//  ExposureViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI
import CoreLocation

final class ExposureViewModel: ObservableObject {
	
	@Published var exposures: [DataModel] = []
	@Published var alertItem: AlertItem?
	@Published var lastUpdated: String = ""
	@Published var selectedExposure: DataModel?

	@Published var isLoading = false
	@Published var isRefreshing = false
	@Published var isShowingDetail = false
	@Published var isShowingList = false

	// get the data
	func getExposureData() {
		
		// activate the loading view
		isLoading = true
		
		// make the network call
		NetworkManager.shared.getExposureSites() { result in
			
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
						dateFormatter.dateFormat = "d/MM h:mm a"
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
}
