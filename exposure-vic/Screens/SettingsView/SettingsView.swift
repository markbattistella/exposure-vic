//
//  SettingsView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct SettingsView: View {
	
	// access to the view model
	@AppStorage("currentPage") var currentPage = 1
	@EnvironmentObject private var mapViewModel: MapViewModel
	@EnvironmentObject private var exposureViewModel: ExposureViewModel
	@EnvironmentObject private var settingsViewModel: SettingsViewModel

	var body: some View {
		
		NavigationView {
			
			Form {
				
				Section {
					Button {
						exposureViewModel.getExposureData()
					} label: {
						Label("Check for new exposures", systemImage: "arrow.down.heart.fill")
					}
					
					HStack {
						FormTextRow(
							title: "Last updated",
							info: "\(exposureViewModel.lastUpdated)"
						)
					}
				}

				Section(
					header: Text("Map options"),
					footer: Text("Note: the ring will be centred around your current location").font(.caption).italic()
				) {
					Toggle(isOn: $settingsViewModel.setting.showRingOverlay) {
						Text("Show travel ring")
					}
					
					Picker(selection: $settingsViewModel.setting.mapRingSize, label: Text("Travel ring size")) {
						ForEach(0 ..< settingsViewModel.mapRingSizes.count) {
							Text( "\(settingsViewModel.mapRingSizes[$0]) km" )
						}
					}.pickerStyle(SegmentedPickerStyle())
				}
				
				Section {
					FormTextRow(
						title: "Version",
						info: "\(settingsViewModel.version ?? "1")"
					)
					NavigationLink(
						destination: AcknowledgementsView(),
						label: { Text("View acknowledgements") }
					)
				}
				
				Section(header: Text("Debug")) {
					Button {
						currentPage = 1
					} label: {
						Text("Reset app data")
					}
				}
			}
			
			// -- title
			.navigationBarTitle("Settings")
			
			// -- bar items
			.navigationBarItems(trailing: Button {
				
				// save the data to show
				saveMapOverlayData()
				
				// dismiss the view
				settingsViewModel.isShowingSettings = false
			} label: {
				Text("Close")
			})
			
			// -- update data on appear
			.onAppear {
				exposureViewModel.getExposureData()
				settingsViewModel.retrieveChanges()
			}
		}
	}


	// save the map overlay daya
	private func saveMapOverlayData() {
		
		// save the coordinates
		settingsViewModel.setting.ringOverlayCenterLatitude = mapViewModel.region.center.latitude
		settingsViewModel.setting.ringOverlayCenterLongitude = mapViewModel.region.center.longitude
		
		// -- show the ring
		mapViewModel.showOverlay = settingsViewModel.setting.showRingOverlay
		
		// -- what ring size
		mapViewModel.overlaySize = settingsViewModel.setting.mapRingSize
		
		// save the changes
		settingsViewModel.saveChanges()
	}
}
