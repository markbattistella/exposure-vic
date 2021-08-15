//
//  ExposureDataModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 15/8/21.
//

import Foundation

// MARK: - ExposureDataModel
struct ExposureDataModel: Decodable {
	let result: Result

	// MARK: - Result
	struct Result: Decodable {
		let records: [Record]
		let total: Int
	}
	
	// MARK: - Record
	struct Record: Decodable {
//		let id: Int
//		let suburb, siteTitle: String
//		let siteStreetaddress: String?
//		let siteState: String
//		let sitePostcode: String?
//		let exposureDateDtm: String
//		let exposureDate: String
//		let exposureTime: String
//		let notes: String
//		let addedDateDtm: String
//		let addedDate: String
//		let addedTime: String
//		let adviceTitle: String
//		let adviceInstruction: String
//		let exposureTimeStart24: String
//		let exposureTimeEnd24: String
//		
//		
//		
		let _id: Int
		let Suburb: String
		let Site_title: String
		let Site_streetaddress: String?
		let Site_state: String
		let Site_postcode: String?
		let Exposure_date_dtm: String
		let Exposure_date: String
		let Exposure_time: String
		let Notes: String
		let Added_date_dtm: String
		let Added_date: String
		let Added_time: String
		let Advice_title: String
		let Advice_instruction: String
		let Exposure_time_start_24: String
		let Exposure_time_end_24: String
		
		
		
		
	}
}
