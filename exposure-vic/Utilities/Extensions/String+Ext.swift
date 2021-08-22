//
//  String+Ext.swift
//  exposure-vic
//
//  Created by Mark Battistella on 22/8/21.
//

import SwiftUI

extension String {
	func sanitise() -> String {
		self
			.replacingOccurrences(of: "\t", with: "")
			.replacingOccurrences(of: "\r", with: "")
			.replacingOccurrences(of: "\n", with: "")
	}
}
