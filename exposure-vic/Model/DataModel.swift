//
//  DataModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import CoreLocation
import SwiftUI

// MARK: - DataModelElement
struct DataModel: Decodable, Identifiable {
	let id: Int
	let suburb: String?
	let siteTitle: String?
	let siteStreetaddress: String?
	let siteState: String?
	let sitePostcode: String?
	let exposureDateDtm: String?
	let exposureDate: String?
	let exposureTime: String?
	let notes: String?
	let addedDateDtm: String?
	let addedDate: String?
	let addedTime: String?
	let adviceTitle: String?
	let adviceInstruction: String?
	let exposureTimeStart24: String?
	let exposureTimeEnd24: String?
	let latitude: Double?
	let longitude: Double?
	
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case suburb = "Suburb"
		case siteTitle = "Site_title"
		case siteStreetaddress = "Site_streetaddress"
		case siteState = "Site_state"
		case sitePostcode = "Site_postcode"
		case exposureDateDtm = "Exposure_date_dtm"
		case exposureDate = "Exposure_date"
		case exposureTime = "Exposure_time"
		case notes = "Notes"
		case addedDateDtm = "Added_date_dtm"
		case addedDate = "Added_date"
		case addedTime = "Added_time"
		case adviceTitle = "Advice_title"
		case adviceInstruction = "Advice_instruction"
		case exposureTimeStart24 = "Exposure_time_start_24"
		case exposureTimeEnd24 = "Exposure_time_end_24"
		case latitude, longitude
	}
	
	// capture the tier level
	var exposureLevel: ExposureLevel {
		var level: ExposureLevel = .tier0
		if let tier = adviceTitle {
			if( tier.startsWith("Tier 1") ) { level = .tier1 }
			if( tier.startsWith("Tier 2") ) { level = .tier2 }
			if( tier.startsWith("Tier 3") ) { level = .tier3 }
		}
		return level
	}
	
	// get the exposure colour
	var exposureColour: Color {
		switch exposureLevel {
			case .tier1:
				return Color(.systemRed)
			case .tier2:
				return Color(.systemOrange)
			case .tier3:
				return Color(.systemBlue)
			default:
				return Color(.systemGray)
		}
	}
	
	// get the coordinates from out api
	var coordinate: CLLocationCoordinate2D {
		var coordinates = CLLocationCoordinate2D(
			latitude: 0.00,
			longitude: 0.00
		)
		
		if let latitude = latitude,
		   let longitude = longitude {
			coordinates = CLLocationCoordinate2D(
				latitude: latitude,
				longitude: longitude
			)
		}
		return coordinates
	}
}
