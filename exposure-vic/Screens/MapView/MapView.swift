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
				coordinateRegion: $mapViewModel.region
					.animation( .linear(duration: 1) ),
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

			// disable the scroll when detail view is open
			.disabled(
				modelData.isShowingDetail || modelData.isRefreshing
			)

			// show map to edges
			.edgesIgnoringSafeArea(.all)

			// blue the list when detail is open
			.blur(radius: modelData.isShowingDetail ? 2 : 0)

			// re-center location after pan and zoom
			.overlay (
				Button {
					withAnimation {
						mapViewModel.recentreLocation()
					}
				} label: {
					MapButtonOverlay(image: "target")
				}
				.padding(.bottom, 20)
				.opacity(modelData.isShowingDetail ? 0 : 1)
				, alignment: .bottomTrailing
			)
			
			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				modelData.getExposureData()
			}
			
			
			// if the detail is to be shown
			if modelData.isShowingDetail {
				DetailView(
					isShowingDetail: $modelData.isShowingDetail,
					exposure: modelData.selectedExposure!
				)
			}
		}
	}
}
