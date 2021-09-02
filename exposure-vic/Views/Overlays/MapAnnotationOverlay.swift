//
//  MapAnnotationOverlay.swift
//  exposure-vic
//
//  Created by Mark Battistella on 2/9/21.
//

import SwiftUI

struct MapAnnotationOverlay: View {
	
	let exposure: ExposureModel
	@EnvironmentObject var settingsViewModel: SettingsViewModel

	var body: some View {

		// filter the outputs
		if( exposure.exposureLevel == 1 ) {
			MapPinOverlay(tint: exposure.exposureColour)
		}
	}
}
