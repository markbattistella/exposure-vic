//
//  ExposureType.swift
//  exposure-vic
//
//  Created by Mark Battistella on 15/8/21.
//

import Foundation

enum ExposureType: String {
	
	case tier1 = "Anyone who has visited this location during these times must get tested immediately and quarantine for 14 days from the exposure."
	
	case tier2 = "Anyone who has visited this location during these times should urgently get tested, then isolate until confirmation of a negative result. Continue to monitor for symptoms, get tested again if symptoms appear."
	
	case tier3 = "Anyone who has visited a Tier 3 exposure site during times listed should monitor for symptoms. If symptoms develop, immediately get a COVID-19 test and isolate until you receive a negative result."
}
