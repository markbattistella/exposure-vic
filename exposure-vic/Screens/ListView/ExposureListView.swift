//
//  ExposureListView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureListView: View {
	
	@StateObject var exposureModelData = ExposureModelData()

	var body: some View {
		
		ZStack {
			NavigationView {
				List(exposureModelData.exposures) { exposure in
					
					// pass in the custom view
					ExposureListCell(exposure: exposure)
						
						// show the detail view on tap
						.onTapGesture {
							exposureModelData.selectedExposure = exposure
							exposureModelData.isShowingDetail = true
						}
				}
				
				// pull down to refresh
				.background( PullToRefresh( action: {
					exposureModelData.getExposureData()
					exposureModelData.isRefreshing = false
				}, isRefreshing: $exposureModelData.isRefreshing))
				
				
				// the navigation title
				.navigationTitle("Exposure List")
				
				// disable the scroll when detail view is open
				.disabled(
					exposureModelData.isShowingDetail ||
					exposureModelData.isRefreshing
				)

			}
			
			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				exposureModelData.getExposureData()
			}
			
			// blue the list when detail is open
			.blur(radius: exposureModelData.isShowingDetail ? 8 : 0)

			// if the detail is to be shown
			if exposureModelData.isShowingDetail {
				DetailView(
					isShowingDetail: $exposureModelData.isShowingDetail,
					exposure: exposureModelData.selectedExposure!
				)
			}

			// show loading spinner when loading
			if exposureModelData.isLoading {
				LoadingView()
			}
		}

		// show error alerts
		.alert(item: $exposureModelData.alertItem) { alertItem in
			Alert(title: alertItem.title,
				  message: alertItem.message,
				  dismissButton: alertItem.dismissButton)
		}
	}

}
