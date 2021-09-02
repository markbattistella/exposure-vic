//
//  ExposureModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import CoreLocation
import SwiftUI

struct ExposureModel: Decodable, Identifiable {
	var id: Int { _id }
	let _id: Int
	let Suburb: String?
	let Site_title: String?
	let Site_streetaddress: String?
	let Site_state: String?
	let Site_postcode: String?
	let Exposure_date_dtm: String?
	let Exposure_date: String?
	let Exposure_time: String?
	let Notes: String?
	let Added_date_dtm: String?
	let Added_date: String?
	let Added_time: String?
	let Advice_title: String?
	let Advice_instruction: String?
	let Exposure_time_start_24: String?
	let Exposure_time_end_24: String?
	
	// capture the tier level
	var exposureLevel: Int {
		var level = 0
		if let tier = Advice_title {
			if( tier.startsWith("Tier 1") ) { level = 1 }
			if( tier.startsWith("Tier 2") ) { level = 2 }
			if( tier.startsWith("Tier 3") ) { level = 3 }
		}
		return level
	}
	
	// get the exposure colour
	var exposureColour: Color {
		switch exposureLevel {
			case 1:
				return Color(.systemRed)
			case 2:
				return Color(.systemOrange)
			case 3:
				return Color(.systemBlue)
			default:
				return Color(.systemGray)
		}
	}
	
	// get the coordinates from out api
	let latitude: Double?
	let longitude: Double?
	var coordinate: CLLocationCoordinate2D {
		var defaultCoordinate = CLLocationCoordinate2D(latitude: 0.00, longitude: 0.00)
		if let latitude = latitude,
		   let longitude = longitude {
			defaultCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		}
		return defaultCoordinate
	}
}
