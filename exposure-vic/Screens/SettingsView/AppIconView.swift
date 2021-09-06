//
//  AppIconView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 6/9/21.
//

import SwiftUI

struct AppIconView: View {
	
	let appIconManager = AppIconManager()
	
	var body: some View {
		
		List {
			AppIconImageView(title: "Default", image: "primary60")
				.onTapGesture { appIconManager.changeAppIcon(to: .primaryIcon) }
			
			AppIconImageView(title: "Black", image: "black60")
				.onTapGesture { appIconManager.changeAppIcon(to: .blackIcon) }
			
			AppIconImageView(title: "Blue", image: "blue60")
				.onTapGesture { appIconManager.changeAppIcon(to: .blueIcon) }
			
			AppIconImageView(title: "Gray", image: "gray60")
				.onTapGesture { appIconManager.changeAppIcon(to: .grayIcon) }
			
			AppIconImageView(title: "Green", image: "green60")
				.onTapGesture { appIconManager.changeAppIcon(to: .greenIcon) }
			
			AppIconImageView(title: "Navy", image: "navy60")
				.onTapGesture { appIconManager.changeAppIcon(to: .navyIcon) }
			
			AppIconImageView(title: "Purple", image: "purple60")
				.onTapGesture { appIconManager.changeAppIcon(to: .purpleIcon) }
			
			AppIconImageView(title: "Red", image: "red60")
				.onTapGesture { appIconManager.changeAppIcon(to: .redIcon) }
			
			AppIconImageView(title: "White", image: "white60")
				.onTapGesture { appIconManager.changeAppIcon(to: .whiteIcon) }
		}
		.navigationBarTitle("Change app icon")
	}
	
	struct AppIconImageView: View {
		let title: String
		let image: String
		var body: some View {
			HStack {
				Image(uiImage: UIImage(imageLiteralResourceName: image))
					.cornerRadius(12)
				Text(title)
			}
		}
	}
}
