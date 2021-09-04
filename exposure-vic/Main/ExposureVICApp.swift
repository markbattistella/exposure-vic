//
//  Exposure_VICApp.swift
//  Exposure VIC
//
//  Created by Mark Battistella on 13/8/21.
//

import SwiftUI

@main
struct Exposure_VICApp: App {
	
	// total number of onboarding pages
	let totalPages = 3
	
	// store the active page
	@AppStorage("currentPage") var currentPage = 1

	var body: some Scene {
		
        WindowGroup {
		
			// -- not onboarding
			if(currentPage > totalPages) {
				MapSwitcherView()

					// theme colour
					.accentColor(Color(.systemPurple))

				// -- onboarding
			} else {
				OnboardingView()
					.background(Color.onBoarding1)
					.edgesIgnoringSafeArea(.all)
			}
        }
    }
}
