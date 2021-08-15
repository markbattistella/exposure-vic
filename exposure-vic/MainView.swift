//
//  ContentView.swift
//  Exposure VIC
//
//  Created by Mark Battistella on 13/8/21.
//

import SwiftUI

struct MainView: View {
	
	// variables
	// -- show the the expose list
	@State private var showExposureList = false
	
	var body: some View {
		
		// zstack
		ZStack {
			
			// map
			Rectangle()
				.foregroundColor(.gray)
				.ignoresSafeArea()
			
			
			VStack {
				
				Spacer()
				
				// hstack - buttons
				HStack(spacing: 40) {
					
					
					Button {
						//
						print("Tapped")
					} label : {
						ToggleButton(icon: "mappin.and.ellipse",
									 backgroundColour: .white,
									 textColour: .black)
					}
					
					Button {
						//
						print("Tapped")
					} label : {
						ToggleButton(icon: "arrow.clockwise.heart.fill",
									 backgroundColour: .white,
									 textColour: .black)
					}
					
					Button {
						//
						print("Tapped")
					} label : {
						ToggleButton(icon: "circle.dashed",
									 backgroundColour: .white,
									 textColour: .black)
					}
					
					Button {
						// toggle the list view
						showExposureList = true
					} label : {
						ToggleButton(icon: "line.horizontal.3",
									 backgroundColour: .white,
									 textColour: .black)
					}
					.sheet(isPresented: $showExposureList) {
						ExposureListView(isPresented: $showExposureList)
							
					}
				}.padding(.bottom)
			}
		}
		
	}
}



struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
