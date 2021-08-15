//
//  ToggleButton.swift
//  Exposure VIC
//
//  Created by Mark Battistella on 15/8/21.
//

import SwiftUI

struct ToggleButton: View {
	
	var icon: String
	var backgroundColour: Color
	var textColour: Color
	
	var body: some View {
		
		ZStack {
			
			Text( Image(systemName: icon) )
				.frame(maxWidth: 48, maxHeight: 48)
				.background( backgroundColour )
				.foregroundColor( textColour )
				.font(.system(size: 20))
				.cornerRadius(8)
		}
	}
}
