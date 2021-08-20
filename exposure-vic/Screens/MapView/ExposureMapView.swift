//
//  MapTrackingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit

struct ExposureMapView: View {
	
	//
	@StateObject var locationViewModel = ExposureMapViewModel()
	@StateObject var exposureModelData = ExposureModelData()

	//
	var body: some View {

		ZStack {

//			Map(
//				coordinateRegion: $locationViewModel.region,
//				showsUserLocation: true,
//				annotationItems: exposureModelData.exposures,
//				annotationContent: { location in
//					MapPin(coordinate: location.coordinates!, tint: .red)
//				}
//			)



			// show the map
			// -- this works without any annotations :(
			Map(
				coordinateRegion: $locationViewModel.region,
				showsUserLocation: true
			)
			.edgesIgnoringSafeArea(.all)

			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				exposureModelData.getExposureData()
				
				for l in exposureModelData.exposures {
					print( String("\(l.coordinates)") )
				}
				
			}
			
			// re-center location after pan and zoom
			VStack {
				Spacer()
				Button {
					locationViewModel.recentreLocation()
				} label: {
					DismissButton(title: "Re-centre", image: "target")
						.shadow(radius: 10)
				}
			}
		}
	}
}
