//
//  ExposureAnnotation.swift
//  exposure-vic
//
//  Created by Mark Battistella on 5/9/21.
//

import UIKit
import MapKit

class ExposureAnnotation: NSObject, MKAnnotation {
	var coordinate: CLLocationCoordinate2D
	var title: String?
	var subtitle: String?
	var type: ExposureLevel
	var exposure: DataModel

	init(_ latitude: CLLocationDegrees,
		 _ longitude: CLLocationDegrees,
		 title: String,
		 subtitle: String = "",
		 type: ExposureLevel,
		 exposure: DataModel
	){
		self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
		self.title = title
		self.subtitle = subtitle
		self.type = type
		self.exposure = exposure
	}
}
