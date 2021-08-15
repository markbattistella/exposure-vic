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
	var exposures = [ExposureData]()
	
	var body: some View {
		
		NavigationView {

			List {
	
				
				
				
				
//				exposures.getExposureData(completion: { item in
//
//					ListItemView(
//						tierValue: "",
//						suburb: item.first?.result.records[0].Suburb ?? "",
//						siteTitle: "",
//						exposureDate: "",
//						exposureTime: "",
//						notes: "",
//						adviceTitle: "",
//						adviceInstruction: ""
//					)
//
//				})
			}

			// title of the view
			.navigationBarTitle(Text("Exposure Sites"))
			
			// close button
			.navigationBarItems(
				leading: Button(action: {
					print("refreshed")
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
