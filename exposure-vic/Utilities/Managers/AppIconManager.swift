//
//  AppIconManager.swift
//  exposure-vic
//
//  Created by Mark Battistella on 6/9/21.
//

import UIKit

final class AppIconManager {
	
	let application = UIApplication.shared
	
	// make it fixed
	enum AppIcon: String {
		case primaryIcon
		case blackIcon
		case blueIcon
		case grayIcon
		case greenIcon
		case navyIcon
		case purpleIcon
		case redIcon
		case whiteIcon
	}
	
	func changeAppIcon(to appIcon: AppIcon) {
		
		// return nil if changing to default
		// else return the selected icon
		let appIconValue: String? = appIcon == .primaryIcon ? nil : appIcon.rawValue
		
		// set the icon
		application.setAlternateIconName(appIconValue)
	}
	
}
