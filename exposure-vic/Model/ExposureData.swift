//
//  ExposureData.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import Foundation
import CoreLocation

// MARK: - ExposureDataModel
struct ExposureData: Decodable {
	let result: ExposureDataResult
}

struct ExposureDataResult: Decodable {
	let records: [ExposureDataRecord]
	let total: Int
}

// MARK: - Record
struct ExposureDataRecord: Decodable, Identifiable {
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
}

// MARK: - RecordCoordinates
struct ExposureCoordinates: Decodable, Identifiable {
	let id = UUID()
	let latitude: Double
	let longitude: Double
	var coordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
