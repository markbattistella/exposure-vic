//
//  ExposureMapViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit
import CoreLocation

final class ExposureMapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

	@Published var authorizationStatus: CLAuthorizationStatus
	@Published var region = MKCoordinateRegion()

	private let locationManager: CLLocationManager
	
	@Published var locations = [ExposureModelRecord]()
	
	override init() {
		locationManager = CLLocationManager()
		authorizationStatus = locationManager.authorizationStatus

		super.init()

		locationManager.delegate = self
		
		// accurate to within one hundred meters
		locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
		
		// Int in metres for tracking movement
		locationManager.distanceFilter = 1

		// begin the location track
		locationManager.startUpdatingLocation()
	}
	
	// trigger apple permission
	func requestPermission() {
		
		// only request when in use
		locationManager.requestWhenInUseAuthorization()
	}
	
	
	// get the current authorised location use
	func locationManager(
		_ manager: CLLocationManager,
		didChangeAuthorization status: CLAuthorizationStatus
	) {
		authorizationStatus = manager.authorizationStatus
	}


	// get the items for the map
	func locationManager(
		_ manager: CLLocationManager,
		didUpdateLocations locations: [CLLocation]
	) {
		
		// unwrap it
		if let location = locations.last {
			
			let latitude = location.coordinate.latitude
			let longitude = location.coordinate.longitude

			region = MKCoordinateRegion(
				center: CLLocationCoordinate2D(
					latitude: latitude,
					longitude: longitude
				),
				span: MKCoordinateSpan(
					latitudeDelta: 0.05,
					longitudeDelta: 0.05
				)
			)
			locationManager.stopUpdatingLocation()
		}
	}

	
	// get the error with locations
	func locationManager(
		_ manager: CLLocationManager,
		didFailWithError error: Error
	) {
		print(error)
	}
	
	
	// call the update location
	func recentreLocation() {
		locationManager.startUpdatingLocation()
	}

}
