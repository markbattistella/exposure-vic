//
//  Pin.swift
//  exposure-vic
//
//  Created by Mark Battistella on 5/9/21.
//

import UIKit
import MapKit

enum ExposureLevel {
	case tier0
	case tier1
	case tier2
	case tier3
}

class ExposureAnnotation: NSObject, MKAnnotation {
	var coordinate: CLLocationCoordinate2D
	var title: String?
	var subtitle: String?
	var type: ExposureLevel

	init(_ latitude: CLLocationDegrees,
		 _ longitude: CLLocationDegrees,
		 title: String,
		 subtitle: String,
		 type: ExposureLevel
	){
		self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
		self.title = title
		self.subtitle = subtitle
		self.type = type
	}
}
