//
//  ListView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ListView: View {
	
	@EnvironmentObject var modelData: ModelData
	
	var body: some View {
		
		ZStack {
			NavigationView {
				
				// get the list
				List(modelData.exposures) { exposure in
					// pass in the custom view
					ListCell(exposure: exposure)
						
						// show the detail view on tap
						.onTapGesture {
							modelData.selectedExposure = exposure
							modelData.isShowingDetail = true
						}
				}
				
				// the navigation title
				.navigationTitle("Exposure List")
				
				// navbar
				.navigationBarItems(
					trailing: Button {
						modelData.getExposureData()
						modelData.isRefreshing = false
					} label: {
						Image(systemName: "arrow.counterclockwise")
							.imageScale(.large)
					}
				)
				
				// pull down to refresh
				.background(
					PullToRefresh( action: {
						modelData.getExposureData()
						modelData.isRefreshing = false
					}, isRefreshing: $modelData.isRefreshing)
				)
				
				// disable the scroll when detail view is open
				.disabled(
					modelData.isShowingDetail || modelData.isRefreshing
				)
			}
			
			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				modelData.getExposureData()
			}
			
			// blue the list when detail is open
			.blur(radius: modelData.isShowingDetail ? 8 : 0)
			
			// if the detail is to be shown
			if modelData.isShowingDetail {
				DetailView(
					isShowingDetail: $modelData.isShowingDetail,
					exposure: modelData.selectedExposure!
				)
			}
			
			// show loading spinner when loading
			if modelData.isLoading {
				LoadingOverlay()
			}
		}
		// show error alerts
		.alert(item: $modelData.alertItem) { alertItem in
			Alert(title: alertItem.title,
				  message: alertItem.message,
				  dismissButton: alertItem.dismissButton)
		}
	}
}
