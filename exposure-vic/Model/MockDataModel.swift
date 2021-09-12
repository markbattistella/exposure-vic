//
//  MockDataModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import Foundation

struct MockDataModel {
	
	// set up a dummy exposure
	static let sampleExposureRecordOne = DataModel(
		id: 1,
		suburb: "Public Transport",
		siteTitle: "Metro Trains - Laverton Line (Newport Station to Southern Cross Station)",
		siteStreetaddress: nil,
		siteState: "VIC",
		sitePostcode: nil,
		exposureDateDtm: "2021-08-11",
		exposureDate: "11/08/2021",
		exposureTime: "10:12am - 10:31am",
		notes: "Case took train",
		addedDateDtm: "2021-08-16",
		addedDate: "16/08/2021",
		addedTime: "13:00:00",
		adviceTitle: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		adviceInstruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		exposureTimeStart24: "10:02:00",
		exposureTimeEnd24: "10:47:00",
		latitude: 40.7127281,
		longitude: -74.0060152
		
	)
	
	static let sampleExposureRecordTwo = DataModel(
		id: 2,
		suburb: "Keysborough",
		siteTitle: "Miele Clearance Centre Keysborough",
		siteStreetaddress: "35-37 Prohasky Street",
		siteState: "VIC",
		sitePostcode: "3173",
		exposureDateDtm: "2021-08-05",
		exposureDate: "05/08/2021",
		exposureTime: "10:02am - 10:47am",
		notes: "Case attended venue",
		addedDateDtm: "2021-08-16",
		addedDate: "16/08/2021",
		addedTime: "13:00:00",
		adviceTitle: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		adviceInstruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		exposureTimeStart24: "10:02:00",
		exposureTimeEnd24: "10:47:00",
		latitude: 48.8588897,
		longitude: 2.320041
	)
	
	static let sampleExposureRecordThree = DataModel(
		id: 3,
		suburb: "Keysborough",
		siteTitle: "Miele Clearance Centre Keysborough",
		siteStreetaddress: "Shop K009/124 Millers Road",
		siteState: "VIC",
		sitePostcode: "3173",
		exposureDateDtm: "2021-08-05",
		exposureDate: "05/08/2021",
		exposureTime: "10:02am - 10:47am",
		notes: "Case attended venue",
		addedDateDtm: "2021-08-16",
		addedDate: "16/08/2021",
		addedTime: "13:00:00",
		adviceTitle: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		adviceInstruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		exposureTimeStart24: "10:02:00",
		exposureTimeEnd24: "10:47:00",
		latitude: 51.5073219,
		longitude: -0.1276474
	)
	static let sampleExposureRecordFour = DataModel(
		id: 4,
		suburb: "Keysborough",
		siteTitle: "Miele Clearance Centre Keysborough",
		siteStreetaddress: "28-29 Borrack Square",
		siteState: "VIC",
		sitePostcode: "3173",
		exposureDateDtm: "2021-08-05",
		exposureDate: "05/08/2021",
		exposureTime: "10:02am - 10:47am",
		notes: "Case attended venue",
		addedDateDtm: "2021-08-16",
		addedDate: "16/08/2021",
		addedTime: "13:00:00",
		adviceTitle: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		adviceInstruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		exposureTimeStart24: "10:02:00",
		exposureTimeEnd24: "10:47:00",
		latitude: -36.8521,
		longitude: 174.763
	)
	
	// build an array of exposures
	static let mockExposuresArray = [
		sampleExposureRecordOne,
		sampleExposureRecordTwo,
		sampleExposureRecordThree,
		sampleExposureRecordFour
	]
}
