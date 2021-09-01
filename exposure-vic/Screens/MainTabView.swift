//
//  MainTabView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct MainTabView: View {
	
	@StateObject var modelData = ModelData()
	@StateObject var settingData = SettingsViewModel()

	var body: some View {
		
		TabView {
			
			// tab 1
			// -- we go to the authorisation switch
			// -- to determine if we show the map,
			// -- error, or request view
			MapViewSwitcher()
				.tabItem {
					Image(systemName: "mappin.and.ellipse")
					Text("Map")
				}
			
			// tab 2
			// -- show the list of sites
			ListView()
				.tabItem {
					Image(systemName: "list.star")
					Text("List")
				}
			
			// tab 3
			// -- settings screen and info
			SettingsView()
				.tabItem {
					Image(systemName: "gearshape.fill")
					Text("Settings")
				}
			
		}
		
		// add model data to the environment
		// -- all child views can access it
		.environmentObject(modelData)
		.environmentObject(settingData)
	}
}
