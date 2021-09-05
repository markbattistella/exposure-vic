//
//  SearchBarView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 5/9/21.
//

import SwiftUI

struct SearchBarView: View {
	
	// the search text
	@Binding var searchText: String
	
	// are we typing
	@State private var isSearching = false
	
	@EnvironmentObject var exposureViewModel: ExposureViewModel

	var body: some View {
		
		HStack {
			
			TextField(
				"Search \(exposureViewModel.exposures.count) exposure sites...",
				text: $searchText) { startedEditing in
				if(startedEditing) {
					withAnimation { isSearching = true }
				}
			} onCommit: {
				withAnimation { isSearching = false }
			}
			.padding(10)
			.padding(.leading, 25)
			.padding(.trailing, isSearching ? 25 : 0)
			.background(Color(.systemGray6))
			.cornerRadius(12)
			
			.overlay(
				HStack {
					Image(systemName: "magnifyingglass")
						.foregroundColor(.gray)
						.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
						.padding(.leading, 8)
					
					if(isSearching) {
						Button {
							searchText = ""
							isSearching = false
							UIApplication.shared.dismissKeyboard()
						} label: {
							Image(systemName: "multiply.circle.fill")
								.foregroundColor(.gray)
								.padding(.trailing, 8)
						}
					}
				}
			)
		}
		.padding(.horizontal)
	}
}
