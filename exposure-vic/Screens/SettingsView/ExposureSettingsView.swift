//
//  ExposureSettingsView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureSettingsView: View {


	// access to the view model
	@StateObject var viewModel = ExposureListViewModel()
	@StateObject var settingModel = ExposureSettingsViewModel()

	// get the app visibility state
	@Environment(\.scenePhase) var scenePhase

	
    var body: some View {

		NavigationView {

			Form {
				
				Section {
					Button {
						viewModel.getExposureData()
					} label: {
						Label("Check for new exposures", systemImage: "arrow.down.heart.fill")
					}
					
					HStack {
						Text("Last updated")
						Spacer()
						Text( viewModel.lastUpdated )
							.foregroundColor(.secondary)
					}
				}

				Section(header: Text("Map options")) {
					Toggle("Show travel ring", isOn: $settingModel.setting.showRingOverlay)
					
					Picker(selection: $settingModel.setting.mapRingSize, label: Text("Travel ring size")) {
						ForEach(0 ..< settingModel.mapRingSizes.count) {
							Text( "\(settingModel.mapRingSizes[$0]) km" )
						}
					}.pickerStyle(SegmentedPickerStyle())
				}
				
				Section {
					Button {
						settingModel.saveChanges()
					} label: {
						HStack {
							Spacer()
							Text("Save settings")
							Spacer()
						}
					}
				}

				Section(header: Text("Acknowledgements")) {
					FormInfoRow(title: "Version", info: "\(settingModel.version ?? "1")")
				}
			
			}
			
			// title
			.navigationBarTitle("Settings")
			
			// update data on appear
			.onAppear {
				viewModel.getExposureData()
				settingModel.retrieveChanges()
			}
			
			// alertalertItem
			.alert(item: $settingModel.alertItem) { alertItem in
				Alert(
					title: alertItem.title,
					message: alertItem.message,
					dismissButton: alertItem.dismissButton
				)
			}
		}
		.accentColor(.green)
	
	}
}

struct ExposureSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ExposureSettingsView()
    }
}
