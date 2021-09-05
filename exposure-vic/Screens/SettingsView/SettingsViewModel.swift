//
//  SettingsViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
	
	@AppStorage("setting") private var settingData: Data?
	@Published var setting = SettingModel()
	@Published private var ringOverlayCenterLatitude: Double?
	@Published private var ringOverlayCenterLongitude: Double?
	
	@Published var isShowingSettings = false

	let mapRingSizes = [ 5, 10, 15, 20, 25 ]

	// get the current version number
	let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
	
	// method: save the settings
	func saveChanges() {
		do {
			// encode the data
			let data = try JSONEncoder().encode(setting)
			
			// set the data to encode from data
			settingData = data
		}  catch {}
	}
	
	// method: retrieve the data
	func retrieveChanges() {
		
		guard let settingData = settingData else { return }
		
		do {
			setting = try JSONDecoder().decode(SettingModel.self, from: settingData)
			
			
		} catch {}
	}
}
