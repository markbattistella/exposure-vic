//
//  ExposureSettingsViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

final class ExposureSettingsViewModel: ObservableObject {
	
	@Published var showRingOverlay = false
	@Published var mapRingSize = 0
	var mapRingSizes = [ 5, 10, 15, 20, 25 ]

	// get the current version number
	let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

}
