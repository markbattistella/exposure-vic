//
//  ExposureListViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

final class ExposureListViewModel: ObservableObject {
	
	@Published var exposures: [ExposureModelRecord] = []
	@Published var alertItem: AlertItem?
	
	func getExposureData() {
		
		// make the network call
		NetworkManager.shared.getExposureSites { result in
			
			// main thread
			DispatchQueue.main.async {
				
				// switch on the output
				switch result {
					
					// success - update the exposures
					case .success(let exposures):
						self.exposures = exposures
						
					// failure - alert
					case .failure(let error):
						
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
