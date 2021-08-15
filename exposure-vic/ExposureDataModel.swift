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
		let id: Int
		let suburb, siteTitle: String
		let siteStreetaddress: String?
		let siteState: String
		let sitePostcode: String?
		let exposureDateDtm: String
		let exposureDate: String
		let exposureTime: String
		let notes: String
		let addedDateDtm: String
		let addedDate: String
		let addedTime: String
		let adviceTitle: String
		let adviceInstruction: String
		let exposureTimeStart24: String
		let exposureTimeEnd24: String
	}
}
