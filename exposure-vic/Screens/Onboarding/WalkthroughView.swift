//
//  WalkthroughView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 22/8/21.
//

import SwiftUI

struct WalkthroughView: View {
	
	let totalPages = 3
	@AppStorage("currentPage") var currentPage = 1
	
	var body: some View {
		ZStack {
			
			if currentPage == 1 {
				ScreenView(
					image: "image1",
					title: "Screen 1",
					description: "Description 1",
					backgroundColour: .onBoarding1
				)
				.transition(.opacity)
			}
			
			if currentPage == 2 {
				ScreenView(
					image: "image2",
					title: "Screen 2",
					description: "Description 2",
					backgroundColour: .onBoarding2
				)
				.transition(.opacity)
			}
			
			if currentPage == 3 {
				ScreenView(
					image: "image3",
					title: "Screen 3",
					description: "Description 3",
					backgroundColour: .onBoarding3
				)
				.transition(.opacity)
			}
		}
		.overlay(

			// progression button
			Button {
				withAnimation {
					if currentPage <= totalPages {
						currentPage += 1
					} else {
						currentPage = 1
					}
				}
			} label: {
				Image(systemName: "chevron.right")
					.frame(width: 60, height: 60)
					.foregroundColor(.black)
					.background(Color.white)
					.clipShape(Rectangle())
					.cornerRadius(12)
			}, alignment: .bottom
		)
	}
}
