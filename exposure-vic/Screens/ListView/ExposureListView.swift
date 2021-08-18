//
//  ExposureListView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct ExposureListView: View {
	
	@StateObject var viewModel = ExposureListViewModel()

	var body: some View {
		
		ZStack {
			NavigationView {
				List(viewModel.exposures, id: \._id) { exposure in
					
					// pass in the custom view
					ExposureListCell(exposure: exposure)
						
						// show the detail view on tap
						.onTapGesture {
							viewModel.selectedExposure = exposure
							viewModel.isShowingDetail = true
						}
				}
				
				// pull down to refresh
				.background( PullToRefresh( action: {
					viewModel.getExposureData()
					viewModel.isRefreshing = false
				}, isRefreshing: $viewModel.isRefreshing))
				
				
				// the navigation title
				.navigationTitle("Exposure List")
				
				// disable the scroll when detail view is open
				.disabled(viewModel.isShowingDetail)
				
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
				viewModel.getExposureData()
			}
			
			// blue the list when detail is open
			.blur(radius: viewModel.isShowingDetail ? 8 : 0)

			// if the detail is to be shown
			if viewModel.isShowingDetail {
				ExposureDetailView(
					exposure: viewModel.selectedExposure!,
					isShowingDetail: $viewModel.isShowingDetail
				)
			}

			// show loading spinner when loading
			if viewModel.isLoading {
				LoadingView()
			}
		}

		// show error alerts
		.alert(item: $viewModel.alertItem) { alertItem in
			Alert(title: alertItem.title,
				  message: alertItem.message,
				  dismissButton: alertItem.dismissButton)
		}
	}

}
