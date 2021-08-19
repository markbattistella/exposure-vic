//
//  ExposureModelMockData.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import Foundation

// dummy data to test with
struct MockData {

	// set up a dummy exposure
	static let sampleExposureRecordOne = ExposureModelRecord(
		_id: 1,
		Suburb: "Keysborough",
		Site_title: "Miele Clearance Centre Keysborough",
		Site_streetaddress: "77 Atlantic Drive",
		Site_state: "VIC",
		Site_postcode: "3173",
		Exposure_date_dtm: "2021-08-05",
		Exposure_date: "05/08/2021",
		Exposure_time: "10:02am - 10:47am",
		Notes: "Case attended venue",
		Added_date_dtm: "2021-08-16",
		Added_date: "16/08/2021",
		Added_time: "13:00:00",
		Advice_title: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		Advice_instruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		Exposure_time_start_24: "10:02:00",
		Exposure_time_end_24: "10:47:00"
	)
	
	static let sampleExposureRecordTwo = ExposureModelRecord(
		_id: 2,
		Suburb: "Keysborough",
		Site_title: "Miele Clearance Centre Keysborough",
		Site_streetaddress: "35-37 Prohasky Street\t",
		Site_state: "VIC",
		Site_postcode: "3173",
		Exposure_date_dtm: "2021-08-05",
		Exposure_date: "05/08/2021",
		Exposure_time: "10:02am - 10:47am",
		Notes: "Case attended venue",
		Added_date_dtm: "2021-08-16",
		Added_date: "16/08/2021",
		Added_time: "13:00:00",
		Advice_title: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		Advice_instruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		Exposure_time_start_24: "10:02:00",
		Exposure_time_end_24: "10:47:00"
	)
	
	static let sampleExposureRecordThree = ExposureModelRecord(
		_id: 3,
		Suburb: "Keysborough",
		Site_title: "Miele Clearance Centre Keysborough",
		Site_streetaddress: "Shop K009/124 Millers Road",
		Site_state: "VIC",
		Site_postcode: "3173",
		Exposure_date_dtm: "2021-08-05",
		Exposure_date: "05/08/2021",
		Exposure_time: "10:02am - 10:47am",
		Notes: "Case attended venue",
		Added_date_dtm: "2021-08-16",
		Added_date: "16/08/2021",
		Added_time: "13:00:00",
		Advice_title: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		Advice_instruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		Exposure_time_start_24: "10:02:00",
		Exposure_time_end_24: "10:47:00"
	)
	static let sampleExposureRecordFour = ExposureModelRecord(
		_id: 4,
		Suburb: "Keysborough",
		Site_title: "Miele Clearance Centre Keysborough",
		Site_streetaddress: "28-29 Borrack Square",
		Site_state: "VIC",
		Site_postcode: "3173",
		Exposure_date_dtm: "2021-08-05",
		Exposure_date: "05/08/2021",
		Exposure_time: "10:02am - 10:47am",
		Notes: "Case attended venue",
		Added_date_dtm: "2021-08-16",
		Added_date: "16/08/2021",
		Added_time: "13:00:00",
		Advice_title: "Tier 2 - Get tested urgently and isolate until you have a negative result",
		Advice_instruction: "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear.",
		Exposure_time_start_24: "10:02:00",
		Exposure_time_end_24: "10:47:00"
	)

	// build an array of exposures
	static let exposures = [
		sampleExposureRecordOne,
		sampleExposureRecordTwo,
		sampleExposureRecordThree,
		sampleExposureRecordFour
	]
}
