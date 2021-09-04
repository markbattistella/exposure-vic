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
				
				Section(header: Text("Map options")) {
					Toggle("Show travel ring", isOn: $settingsViewModel.setting.showRingOverlay)
					
					Picker(selection: $settingsViewModel.setting.mapRingSize, label: Text("Travel ring size")) {
						ForEach(0 ..< settingsViewModel.mapRingSizes.count) {
							Text( "\(settingsViewModel.mapRingSizes[$0]) km" )
						}
					}.pickerStyle(SegmentedPickerStyle())
				}
				
				Section {
					Button {
						settingsViewModel.saveChanges()
					} label: {
						HStack {
							Spacer()
							Text("Save settings")
							Spacer()
						}
					}
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
				settingsViewModel.isShowingSettings = false
			} label: {
				Text("Close")
					.foregroundColor(.red)
			})
			
			// -- update data on appear
			.onAppear {
				exposureViewModel.getExposureData()
				settingsViewModel.retrieveChanges()
			}
			
			// alertalertItem
			.alert(item: $settingsViewModel.alertItem) { alertItem in
				Alert(
					title: alertItem.title,
					message: alertItem.message,
					dismissButton: alertItem.dismissButton
				)
			}
		}
	}
}
