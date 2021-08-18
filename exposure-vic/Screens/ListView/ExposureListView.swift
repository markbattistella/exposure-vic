//
//  ExposureListView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureListView: View {
	
	@StateObject var exposureViewModel = ExposureListViewModel()

	var body: some View {
		
		ZStack {
			NavigationView {
				List(exposureViewModel.exposures, id: \._id) { exposure in
					
					// pass in the custom view
					ExposureListCell(exposure: exposure)
						
						// show the detail view on tap
						.onTapGesture {
							exposureViewModel.selectedExposure = exposure
							exposureViewModel.isShowingDetail = true
						}
				}
				
				// pull down to refresh
				.background( PullToRefresh( action: {
					exposureViewModel.getExposureData()
					exposureViewModel.isRefreshing = false
				}, isRefreshing: $exposureViewModel.isRefreshing))
				
				
				// the navigation title
				.navigationTitle("Exposure List")
				
				// disable the scroll when detail view is open
				.disabled(exposureViewModel.isShowingDetail)
				
				// add a reload button
				// TODO: - add in pull to refresh
//				.navigationBarItems(trailing: Button(action:{
//					viewModel.getExposureData()
//				}, label: {
//					Text("Reload")
//				}))
			}
			
			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				exposureViewModel.getExposureData()
			}
			
			// blue the list when detail is open
			.blur(radius: exposureViewModel.isShowingDetail ? 8 : 0)

			// if the detail is to be shown
			if exposureViewModel.isShowingDetail {
				ExposureDetailView(
					exposure: exposureViewModel.selectedExposure!,
					isShowingDetail: $exposureViewModel.isShowingDetail
				)
			}

			// show loading spinner when loading
			if exposureViewModel.isLoading {
				LoadingView()
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
