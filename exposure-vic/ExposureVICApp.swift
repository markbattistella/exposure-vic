//
//  Exposure_VICApp.swift
//  Exposure VIC
//
//  Created by Mark Battistella on 13/8/21.
//

import SwiftUI

@main
struct Exposure_VICApp: App {
	
	let totalPages = 3
	@AppStorage("currentPage") var currentPage = 1

	var body: some Scene {
        WindowGroup {
			// check if we are onboarding or not
			if currentPage > totalPages {
				MainTabView()
			} else {
				WalkthroughView()
			}
        }
    }
}
