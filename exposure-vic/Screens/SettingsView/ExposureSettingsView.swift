//
//  ExposureSettingsView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureSettingsView: View {
	
	@StateObject var viewModel = ExposureListViewModel()
	private let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
	
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
				
				Section(header: Text("Acknowledgements")) {
					HStack {
						Text("Version")
						Spacer()
						Text( version ?? "1.0" )
							.foregroundColor(.secondary)
					}
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
