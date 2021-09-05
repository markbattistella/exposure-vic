//
//  SettingModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import Foundation

struct SettingModel: Codable {
	var mapRingSize: Int = 0
	var showRingOverlay: Bool = false
	var ringOverlayCenterLatitude: Double?
	var ringOverlayCenterLongitude: Double?
}
