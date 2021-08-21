//
//  DetailView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct DetailView: View {
	
	@Binding var isShowingDetail: Bool
	let exposure: ExposureDataRecord
	
    var body: some View {

		VStack {
			Text(exposure.Site_title ?? "NIL")
		}
		.frame(width: 300, height: 500)
		.background(Color(.systemBackground))
		.cornerRadius(12)
		.shadow(radius: 40)
		
		.overlay(Button {
			isShowingDetail = false
		} label: {
			OverlayButton(image: "xmark")
		}, alignment: .topTrailing)
	}
}
