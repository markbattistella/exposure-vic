//
//  MapAnnotationView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 19/8/21.
//

import SwiftUI
import CoreLocation

//struct MapAnnotationView: ObservableObject {
//
//	@StateObject var exposureViewModel = ExposureListViewModel()
//	
//	var addresses: [String] = []
//
//	var body: some View {
//
//		List(addresses, id: \.self) { a in
//			Text(a)
//		}
//	}
//
//	
//	
//	mutating func runScript() {
//		
////		let geoCoder = CLGeocoder()
//		let exposures = exposureViewModel.exposures
//		
//		
//		for i in 0 ..< exposures.count {
//			guard let address = exposures[i].Site_streetaddress else { return }
//			
//			print(address)
//			
//			addresses.append( address )
//		}
//		//			geoCoder.geocodeAddressString(exposure.Site_streetaddress, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
//		//			})
//
//	}
//}
