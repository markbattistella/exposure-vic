//
//  MapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	@EnvironmentObject var modelData: ModelData
	@EnvironmentObject var settingsViewModel: SettingsViewModel
	@StateObject var mapViewModel = MapViewModel()
	
	var body: some View {
		
		ZStack {
			
			// show the map
			Map(
				coordinateRegion: $mapViewModel.region,
				interactionModes: .all,
				showsUserLocation: true,
				annotationItems: modelData.exposures,
				annotationContent: { exposure in
					MapAnnotation(
						coordinate: exposure.coordinate,
						content: {
							MapPinOverlay(tint: exposure.exposureColour)
								.onTapGesture {
									modelData.selectedExposure = exposure
									modelData.isShowingDetail = true
								}
						}
					)
				}
			)
			.accentColor(Color(.systemGreen))
			.animation( .linear(duration: 20) )
			.edgesIgnoringSafeArea(.all)
			.blur(radius: modelData.isShowingDetail ? 2 : 0)
			.disabled( modelData.isShowingDetail )
			
			// overlay items
			VStack {
				
				// top bar legend
				LegendOverlay()
				
				Spacer()
				
				// re-center
				HStack {
					Spacer()
					
					// re-center location after pan and zoom
					Button {
						withAnimation { mapViewModel.recentreLocation() }
					} label: {
						MapButtonOverlay(image: "location.circle.fill")
					}
				}
			}
			.padding()
			.blur(radius: modelData.isShowingDetail ? 2 : 0)
			.disabled( modelData.isShowingDetail )
			
			// if the detail is to be shown
			if modelData.isShowingDetail {
				DetailView(
					isShowingDetail: $modelData.isShowingDetail,
					exposure: modelData.selectedExposure!
				)
			}
		}
		
		// when the view is activated
		.onAppear {
			modelData.getExposureData()
			settingsViewModel.retrieveChanges()
		}
	}
}
