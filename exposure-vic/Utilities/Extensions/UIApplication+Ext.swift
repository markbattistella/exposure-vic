//
//  UIApplication+Ext.swift
//  exposure-vic
//
//  Created by Mark Battistella on 5/9/21.
//

import UIKit

extension UIApplication {
	func dismissKeyboard() {
		sendAction(
			#selector(UIResponder.resignFirstResponder),
			to: nil,
			from: nil,
			for: nil
		)
	}
}
