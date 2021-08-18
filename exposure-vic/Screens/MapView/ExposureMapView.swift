//
//  ExposureMapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureMapView: View {
	
	var body: some View {

		// get the map permission
		// -- shows the success view
		// -- if denied shows message of no access
		MapPermissionsView()

	}
}

struct ExposureMapView_Previews: PreviewProvider {
	static var previews: some View {
		ExposureMapView()
	}
}
