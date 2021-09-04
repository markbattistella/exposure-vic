//
//  OnboardingView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 22/8/21.
//

import SwiftUI

struct OnboardingView: View {
	
	let totalPages = 3
	@AppStorage("currentPage") var currentPage = 1
	
	var body: some View {
		ZStack(alignment: .top) {
			
			if currentPage == 1 {
				OnboardingScreenView(
					image: "image1",
					title: "Check the map",
					description: "Use your location to check for any exposure sites near you",
					backgroundColour: .onBoarding1
				)
				.transition(.opacity)
			}
			
			if currentPage == 2 {
				OnboardingScreenView(
					image: "image2",
					title: "Check the list",
					description: "Scroll throught the list of exposure sites to see if you have been affected",
					backgroundColour: .onBoarding2
				)
				.transition(.opacity)
			}
			
			if currentPage == 3 {
				OnboardingScreenView(
					image: "image3",
					title: "Safe together",
					description: "So in the end we can keep ourselves and the ones we love safe and healthy",
					backgroundColour: .onBoarding3
				)
				.transition(.opacity)
			}
			
			VStack {
				Spacer()
				HStack(spacing: 20) {
					
					if(currentPage > 1 && currentPage < 4) {
						Spacer()
						Button {
							withAnimation {
								currentPage -= 1
							}
						} label: {
							Image(systemName: "chevron.left")
								.frame(width: 50, height: 50)
								.foregroundColor(.black)
								.background(Color.white)
								.clipShape(Rectangle())
								.cornerRadius(12)
						}
					}
					// push it centre
					Spacer()

					Button {
						withAnimation {
							if(currentPage <= totalPages) {
								currentPage += 1
							} else {
								currentPage = 1
							}
						}
					} label: {
						HStack {
							Text("Next")
								.padding(.trailing, 10)
							Image(systemName: "chevron.right")
						}
						.frame(width: 140, height: 50)
						.foregroundColor(.black)
						.background(Color.white)
						.clipShape(Rectangle())
						.cornerRadius(12)
					}
					
					// push it centre
					Spacer()
					
				}.padding(.bottom, 60)
				
			}
		}
	}
}
