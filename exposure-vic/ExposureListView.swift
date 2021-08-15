//
//  ExposureList.swift
//  Exposure VIC
//
//  Created by Mark Battistella on 15/8/21.
//

import SwiftUI

struct ExposureListView: View {
	
	// variables
	@Binding var isPresented: Bool
	
	//
	var exposures = ExposureData()
	
	var body: some View {
		
		NavigationView {

			var r = exposures.getExposureData(completion: { item in
				print(item)
			})

			
			Text("R")

					
				// list of the exposure sites
			
//				exposures.getExposureData(completion: { item in
//					print(item)
//				})

				
			// title of the view
			.navigationBarTitle(Text("Exposure Sites"))
			
			// close button
			.navigationBarItems(
				leading: Button(action: {
					print(r)
				}, label: {
					Text("Test")
				}), trailing: Button(action: {
					isPresented = false }) {
				Text("Close")
					.foregroundColor(.red)
			})
		}
	}
}
