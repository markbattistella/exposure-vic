//
//  ListView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ListView: View {
	
	@EnvironmentObject var exposureViewModel: ExposureViewModel
	
	var body: some View {

		ZStack {
			
			NavigationView {
			
				// get the list
				List(exposureViewModel.exposures) { exposure in
				
					// pass in the custom view
					ListCell(exposure: exposure)
					
						// show the detail view on tap
						.onTapGesture {
							exposureViewModel.selectedExposure = exposure
							exposureViewModel.isShowingDetail = true
						}
				}
		
				// the navigation title
				.navigationTitle("Exposure List")
			
				// navbar
				.navigationBarItems(
					leading: Button {
						exposureViewModel.getExposureData()
						exposureViewModel.isRefreshing = false
					} label: {
						Label("Refresh", systemImage: "arrow.down.heart.fill")
					},
					
					trailing: Button {
						exposureViewModel.isShowingList = false
					} label: {
						Text("Close")
							.foregroundColor(.red)
					}
				)
			
				// pull down to refresh
				.background(
					PullToRefresh( action: {
						exposureViewModel.getExposureData()
						exposureViewModel.isRefreshing = false
					}, isRefreshing: $exposureViewModel.isRefreshing)
				)
			}

			// disable the scroll when detail view is open
			.disabled(
				exposureViewModel.isShowingDetail ||
					exposureViewModel.isRefreshing
			)

			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				exposureViewModel.getExposureData()
			}
		
			// blue the list when detail is open
			.blur(radius: exposureViewModel.isShowingDetail ? 2 : 0)
				
			
			// if the detail is to be shown
			if(exposureViewModel.isShowingDetail) {
				DetailView(
					isShowingDetail: $exposureViewModel.isShowingDetail,
					exposure: exposureViewModel.selectedExposure!
				)
			}
			
			// show loading spinner when loading
			if(exposureViewModel.isLoading) {
				LoadingOverlay()
			}
		}
		
		// show error alerts
		.alert(item: $exposureViewModel.alertItem) { alertItem in
			Alert(title: alertItem.title,
				  message: alertItem.message,
				  dismissButton: alertItem.dismissButton)
		}
	}
}
