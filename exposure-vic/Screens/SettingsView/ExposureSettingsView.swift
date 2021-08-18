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
					Toggle("Show travel ring", isOn: $settingModel.showRingOverlay)
					
					if settingModel.showRingOverlay {
						Picker(selection: $settingModel.mapRingSize, label: Text("Travel ring")) {
							ForEach(0 ..< settingModel.mapRingSizes.count) {
								Text( "\(settingModel.mapRingSizes[$0]) km" )
							}
						}
					}
				}

				Section(header: Text("Acknowledgements")) {
					FormInfoRow(title: "Version", info: "\(settingModel.version ?? "1")")
				}
			
			}
			
			.navigationBarTitle("Settings")
			
			.onAppear {
				viewModel.getExposureData()
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
