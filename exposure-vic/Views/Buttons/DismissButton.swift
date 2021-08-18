//
//  DismissButton.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct DismissButton: View {

	var body: some View {

		ZStack {
			Circle()
				.frame(width: 30, height: 30)
				.foregroundColor(.gray)
				.opacity(0.5)
			Image(systemName: "xmark")
				.imageScale(.medium)
				.frame(width: 44, height: 44)
				.foregroundColor(.black)
		}
	}
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
