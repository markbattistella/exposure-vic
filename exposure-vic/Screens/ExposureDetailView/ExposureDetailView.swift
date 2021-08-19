//
//  ExposureDetailView.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct ExposureDetailView: View {
	
	let exposure: ExposureModelRecord
	@Binding var isShowingDetail: Bool
	
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
			DismissButton(title: "close",image: "xmark")
		}, alignment: .topTrailing)
	}
}
