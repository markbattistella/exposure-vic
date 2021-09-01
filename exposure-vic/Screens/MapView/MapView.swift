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
							MapPin(level: exposure.level)
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

			// legend
			VStack {
				HStack(spacing: 60) {
					LegendItemOverlay(tierNumber: 1, tierColour: Color(.systemRed))
					LegendItemOverlay(tierNumber: 2, tierColour: Color(.systemOrange))
					LegendItemOverlay(tierNumber: 3, tierColour: Color(.systemBlue))
				}
				.padding()
				.frame(maxWidth: .infinity)
				.background(Color(.systemBackground))
				.cornerRadius(12)
				.padding()
				.shadow(radius: 8)
				
				Spacer()
				
				HStack {
					Spacer()
					
					VStack(spacing: 20) {
						
						// show ring on map
						Button {
							//
						} label: {
							MapButtonOverlay(image: "circle.dashed")
						}
						
						// re-center location after pan and zoom
						Button {
							withAnimation { mapViewModel.recentreLocation() }
						} label: {
							MapButtonOverlay(image: "location.circle.fill")
						}
					}
					.padding()
					
				}
			}
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
		.onAppear { modelData.getExposureData() }
	}
}
