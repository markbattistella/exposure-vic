//
//  MapViewModel.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit

enum MapDetails {
	static let defaultLatitudinalMeters = CLLocationDistance(500)
	static let defaultLongitudinalMeters = CLLocationDistance(500)
}

// map data goes here
class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
	
	private let manager = CLLocationManager()

	@Published var mapView = MKMapView()
	@Published var region = MKCoordinateRegion()
	@Published var authorizationStatus: CLAuthorizationStatus

	@Published var showOverlay: Bool = false
	@Published var overlaySize: Int = 0

	// MARK: - initialisation
	override init() {
		authorizationStatus = manager.authorizationStatus
		super.init()
		manager.delegate = self
		manager.startUpdatingLocation()
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
			latitudinalMeters: MapDetails.defaultLatitudinalMeters,
			longitudinalMeters: MapDetails.defaultLongitudinalMeters
		)
		
		// set the region
		mapView.setRegion(region, animated: true)
		
		// animate the focus
		mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
		
		// stop using the gps
		manager.stopUpdatingLocation()
	}
	
	// get the error with locations
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error.localizedDescription)
	}
	
	
	// MARK: - methods
	
	// trigger apple permission
	func requestPermission() {
		manager.requestWhenInUseAuthorization()
	}
	
	// call the update location
	func recentreLocation() {
		
		guard let location = manager.location?.coordinate else { return }
		
		region = MKCoordinateRegion(
			center: location,
			latitudinalMeters: MapDetails.defaultLatitudinalMeters,
			longitudinalMeters: MapDetails.defaultLongitudinalMeters
		)
		
		// set the region
		mapView.setRegion(region, animated: true)
		
		// animate the focus
		mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
		
		// stop using the gps
		manager.stopUpdatingLocation()
		
		// try remove memory leak
		manager.delegate = nil
	}
}
