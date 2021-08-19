//
//  MapAnnotationViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 19/8/21.
//

import SwiftUI

final class MapAnnotationViewModel: ObservableObject {
	
	@StateObject var exposureViewModel = ExposureListViewModel()

	// empty array
	var locations: [MapLocation] {
		
		for exposure in exposureViewModel.exposures {
			MapLocation(exposures: exposure)
		}

		return MapLocation
	}
}
