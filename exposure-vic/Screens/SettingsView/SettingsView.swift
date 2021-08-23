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
	@EnvironmentObject var modelData: ModelData
	@EnvironmentObject var settingsViewModel: SettingsViewModel
	
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
						FormTextRow(
							title: "Last updated",
							info: "\(modelData.lastUpdated)"
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
				
				Section(header: Text("Debug")) {
					Button {
						currentPage = 1
					} label: {
						Text("Reset onboarding")
					}
				}
				
				Section {
					NavigationLink(
						destination: AcknowledgementsView(),
						label: { Text("View acknowledgements") }
					)
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
