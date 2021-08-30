//
//  String+Ext.swift
//  exposure-vic
//
//  Created by Mark Battistella on 22/8/21.
//

import SwiftUI

// remove the bad characters
extension String {
	func sanitise() -> String {
		self
			.replacingOccurrences(of: "\t", with: "")
			.replacingOccurrences(of: "\r", with: "")
			.replacingOccurrences(of: "\n", with: "")
	}
}

// get the beginning of string
extension String {
	func startsWith(_ prefix: String) -> Bool {
		return lowercased().hasPrefix(prefix.lowercased())
	}
}
