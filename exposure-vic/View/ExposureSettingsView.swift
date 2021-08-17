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
						Label("Refresh exposure sites", systemImage: "arrow.down.heart.fill")
					}
				}
				
				Section(header: Text("Acknowledgements")) {
					HStack {
						Text("Version")
						Spacer()
						Text( version ?? "1.0" )
					}

				}
			
			}
			
			.navigationBarTitle("Settings")
		}
		.accentColor(.green)
	
	}
}

struct ExposureSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ExposureSettingsView()
    }
}
