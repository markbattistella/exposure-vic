//
//  View+Ext.swift
//  exposure-vic
//
//  Created by Mark Battistella on 2/9/21.
//

import SwiftUI

extension View {
	func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
		overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
	}
}
