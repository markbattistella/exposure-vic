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
	@Published var lastSeenLocation: CLLocation?
	@Published var currentPlacemark: CLPlacemark?
	@Published var region = MKCoordinateRegion()

	private let locationManager: CLLocationManager
	
	override init() {
		locationManager = CLLocationManager()
		authorizationStatus = locationManager.authorizationStatus
		
		super.init()
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.distanceFilter = 0.1
		locationManager.startUpdatingLocation()
	}
	
	func requestPermission() {
		locationManager.requestWhenInUseAuthorization()
	}
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		authorizationStatus = manager.authorizationStatus
	}
	
	// get the items for the map
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		lastSeenLocation = locations.first
		
		region = MKCoordinateRegion(
			center: CLLocationCoordinate2D(
				latitude: lastSeenLocation?.coordinate.latitude ?? 0,
				longitude: lastSeenLocation?.coordinate.longitude ?? 0
			),
			span: MKCoordinateSpan(
				latitudeDelta: 0.1,
				longitudeDelta: 0.1
			)
		)
	}
}
