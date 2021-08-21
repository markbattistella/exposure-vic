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
struct ExposureModelRecord: Decodable, Identifiable {
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
	
	// get the co-ordinates now
	func getCoordinates(handler: @escaping ((CLLocationCoordinate2D) -> Void)) {
		if let address = Site_streetaddress,
		   let suburb = Suburb,
		   let postcode = Site_postcode,
		   let state = Site_state {

			CLGeocoder().geocodeAddressString("\(address) \(suburb) \(state) \(postcode)") { ( placemark, error ) in

				// errors
				if let error = error as? CLError {
					switch error.code {
						case .locationUnknown:
							print("locationUnknown: location manager was unable to obtain a location value right now.")
						case .denied:
							print("denied: user denied access to the location service.")
						case .promptDeclined:
							print("promptDeclined: user didn’t grant the requested temporary authorization.")
						case .network:
							print("network: network was unavailable or a network error occurred.")
						case .headingFailure:
							print("headingFailure: heading could not be determined.")
						case .rangingUnavailable:
							print("rangingUnavailable: ranging is disabled.")
						case .rangingFailure:
							print("rangingFailure: a general ranging error occurred.")
						default : break
					}
				}

				// success
				handler(
					placemark?.first?.location?.coordinate ?? CLLocationCoordinate2D()
				)
			}
		}
	}
}
