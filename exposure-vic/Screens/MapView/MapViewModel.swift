//
//  MapViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit
import CoreLocation

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
	
	// variables
	@Published var authorizationStatus: CLAuthorizationStatus
	@Published var region = MKCoordinateRegion()
	private let locationManager: CLLocationManager
	
	// initialisation
	override init() {
		locationManager = CLLocationManager()
		authorizationStatus = locationManager.authorizationStatus
		super.init()
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
		locationManager.startUpdatingLocation()
	}
	
	// MARK: - methods
	
	// trigger apple permission
	func requestPermission() {
		locationManager.requestWhenInUseAuthorization()
	}
	
	// call the update location
	func recentreLocation() {
		locationManager.startUpdatingLocation()
	}
	
	
	// MARK: - stubs
	
	// get the current authorised location use
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		authorizationStatus = manager.authorizationStatus
	}
	
	// get the items for the map
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let location = locations.last else { return }
		region = MKCoordinateRegion(
			center: location.coordinate,
			latitudinalMeters: 8000, // 8km wide
			longitudinalMeters: 8000 // 8km tall
		)
		locationManager.stopUpdatingLocation()
	}
	
	
	// get the error with locations
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error.localizedDescription)
	}
}
