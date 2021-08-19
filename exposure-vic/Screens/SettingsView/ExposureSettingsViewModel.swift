//
//  ExposureSettingsViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

final class ExposureSettingsViewModel: ObservableObject {
	
	@AppStorage("setting") private var settingData: Data?
	@Published var setting = Settings()
	@Published var alertItem: AlertItem?
	
	var mapRingSizes = [ 5, 10, 15, 20, 25 ]

	// get the current version number
	let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String


	// method: save the settings
	func saveChanges() {
		do {
			// encode the data
			let data = try JSONEncoder().encode(setting)
			
			// set the data to encode from data
			settingData = data
			
			// alert user settings saved
			alertItem = AlertContext.successfulSaveSettings
		} catch {
			// get the error
			alertItem = AlertContext.unableToSaveSettings
		}
	}
	
	// method: retrieve the data
	func retrieveChanges() {
		
		guard let settingData = settingData else { return }
		
		do {
			setting = try JSONDecoder().decode(Settings.self, from: settingData)
		} catch {
			alertItem = AlertContext.unableToRetrieveSettings
		}
	}
}