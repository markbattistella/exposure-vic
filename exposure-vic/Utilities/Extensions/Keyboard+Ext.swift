//
//  Keyboard+Etx.swift
//  exposure-vic
//
//  Created by Mark Battistella on 23/8/21.
//

import UIKit

extension UIApplication {
	func dismissKeyboard() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
