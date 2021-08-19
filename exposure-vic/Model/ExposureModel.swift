//
//  ExposureModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import Foundation
import CoreLocation

// MARK: - ExposureDataModel
struct ExposureModel: Decodable {
	let result: ExposureModelResult
}

struct ExposureModelResult: Decodable {
	let records: [ExposureModelRecord]
	let total: Int
}

// MARK: - Record
struct ExposureModelRecord: Decodable {
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
	
	// get the co-ordinates now
	var coordinates: CLLocationCoordinate2D? {
		let geocoder = CLGeocoder()
		var output = CLLocationCoordinate2D()
		guard let address = Site_streetaddress else { return nil }
		geocoder.geocodeAddressString( address ) { ( placemark, error ) in
			guard let longitude = placemark?.first?.location?.coordinate.longitude,
				  let latitude  = placemark?.first?.location?.coordinate.latitude else {
				return
			}
			output = CLLocationCoordinate2D(
				latitude: latitude,
				longitude: longitude
			)
		}
		return output
	}
}
