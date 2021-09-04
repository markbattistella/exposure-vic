//
//  MapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 17/8/21.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	// data sets
	@StateObject var mapViewModel = MapViewModel()
	@StateObject var exposureViewModel = ExposureViewModel()
	@StateObject var settingsViewModel = SettingsViewModel()
	
	var body: some View {
		
		ZStack {
			
			// -- map
			UIMapView()
				.environmentObject(mapViewModel)
				.ignoresSafeArea()
				.blur(radius: exposureViewModel.isShowingDetail ? 2 : 0)
				.disabled( exposureViewModel.isShowingDetail )
			
			
			// map overlay items
			VStack {
				
				// -- top bar legend
				LegendOverlay()
				
				Spacer()
				
				// -- bottom bar
				HStack(spacing: 20) {
					
					// -- settings
					Button {
						settingsViewModel.isShowingSettings = true
					} label: {
						Label("Settings", systemImage: "gearshape.fill")
							.labelStyle(IconOnlyLabelStyle())
							.padding()
							.background(Color(.systemBackground))
							.cornerRadius(12)
					}
					
					// -- list view
					Button {
						exposureViewModel.isShowingList = true
					} label: {
						Label("List view", systemImage: "list.number")
							.frame(maxWidth: .infinity)
							.padding()
							.background(Color(.systemBackground))
							.cornerRadius(12)
					}
					
					// -- recenter location
					Button {
						mapViewModel.recentreLocation()
					} label: {
						Label("Re-centre location", systemImage: "location.fill")
							.labelStyle(IconOnlyLabelStyle())
							.padding()
							.background(Color(.systemBackground))
							.cornerRadius(12)
					}
				}
				.padding(.bottom, 10)
				.shadow(radius: 10)
			}
			.padding(20)
			.blur(radius: exposureViewModel.isShowingDetail ? 2 : 0)
			.disabled( exposureViewModel.isShowingDetail )
			
			// if the detail is to be shown
			if(exposureViewModel.isShowingDetail) {
				DetailView(
					isShowingDetail: $exposureViewModel.isShowingDetail,
					exposure: exposureViewModel.selectedExposure!
				)
			}
		}
		
		// -- settings
		.fullScreenCover(
			isPresented: $settingsViewModel.isShowingSettings,
			content: {
				SettingsView()
					// add model data to the environment
					// -- all child views can access it
					.environmentObject(exposureViewModel)
					.environmentObject(settingsViewModel)
			}
		)
		
		// -- list view
		.fullScreenCover(
			isPresented: $exposureViewModel.isShowingList,
			content: {
				ListView()
					// add model data to the environment
					// -- all child views can access it
					.environmentObject(exposureViewModel)
					.environmentObject(settingsViewModel)
			}
		)
		
		// when the view is activated
		.onAppear {
			exposureViewModel.getExposureData()
			settingsViewModel.retrieveChanges()
		}
	}
}
