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
					
				}
				
				.navigationTitle("Exposure List")
				.navigationBarItems(trailing: Button(action:{
					viewModel.getExposureData()
				}, label: {
					Text("Reload")
				}))
			}
			
			// when the view is activated
			// -- insert the reload from network
			.onAppear {
				viewModel.getExposureData()
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
