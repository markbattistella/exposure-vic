//
//  SettingsView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct SettingsView: View {

	// access to the view model
	@EnvironmentObject var modelData: ModelData
	@StateObject var settingsViewModel = SettingsViewModel()

	var body: some View {

		NavigationView {

			Form {
				
				Section {
					Button {
						modelData.getExposureData()
					} label: {
						Label("Check for new exposures", systemImage: "arrow.down.heart.fill")
					}
					
					HStack {
						Text("Last updated")
						Spacer()
						Text( modelData.lastUpdated )
							.foregroundColor(.secondary)
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

				Section(header: Text("Acknowledgements")) {
					FormTextRow(
						title: "Version",
						info: "\(settingsViewModel.version ?? "1")"
					)
					FormURLRow(
						title: "Twitter",
						urlTitle: "@markbattistella",
						url: "https://twitter.com/@markbattistella")
					FormURLRow(
						title: "GitHub",
						urlTitle: "/markbattistella",
						url: "https://github.com/markbattistella")
				}
			}
			
			// title
			.navigationBarTitle("Settings")
			
			// update data on appear
			.onAppear {
				modelData.getExposureData()
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
