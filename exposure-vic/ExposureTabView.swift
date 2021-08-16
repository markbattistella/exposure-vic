//
//  MapView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureTabView: View {
	
	var body: some View {
		
		TabView {
			
			// tab 1
			ExposureMapView()
				.tabItem {
					Image(systemName: "mappin.and.ellipse")
					Text("Map")
				}

			// tab 2
			ExposureListView()
				.tabItem {
					Image(systemName: "list.star")
					Text("List")
				}

			// tab 3
			ExposureSettingsView()
				.tabItem {
					Image(systemName: "gearshape.fill")
					Text("Settings")
				}
		}
		.accentColor(.purple)
	}
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		ExposureTabView()
	}
}
