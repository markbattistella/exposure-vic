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
	var exposures: ExposureDataModel?
	
	var body: some View {
		
		
		NavigationView {

			// list of the exposure sites
			List {
				Text("test")
			}
			
			// title of the view
			.navigationBarTitle(Text("Exposure Sites"))
			
			// close button
			.navigationBarItems(
				leading: Button(action: {
					print(exposures)
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
