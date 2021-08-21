//
//  OverlayButton.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct OverlayButton: View {
	
	let image: String
	
	var body: some View {
		
		Image(systemName: image)
			.padding(10)
			.background(Color.white)
			.clipShape(Circle())
			.padding()
			.shadow(radius: 10)
	}
}
