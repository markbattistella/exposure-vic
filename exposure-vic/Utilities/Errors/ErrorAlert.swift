//
//  Alert.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import SwiftUI

struct AlertItem: Identifiable {
	let id = UUID()
	let title: Text
	let message: Text
	let dismissButton: Alert.Button
}

struct AlertContext {
	
	// network alerts
	static let invalidData = AlertItem(
		title: Text("Server Error"),
		message: Text("The data received from the server was invalid. Please contact support."),
		dismissButton: .default(Text("OK"))
	)
	
	static let invalidResponse = AlertItem(
		title: Text("Server Error"),
		message: Text("Invalid response from the server. Please try again later or contact support."),
		dismissButton: .default(Text("OK"))
	)
	
	static let invalidURL = AlertItem(
		title: Text("Server Error"),
		message: Text("There was an issue contacting the server. If this persists, please contact support."),
		dismissButton: .default(Text("OK"))
	)
	
	static let unableToComplete = AlertItem(
		title: Text("Server Error"),
		message: Text("Unable to complete your request at this time. Please check your internet connection."),
		dismissButton: .default(Text("OK"))
	)


	// setting alerts
	static let successfulSaveSettings = AlertItem(
		title: Text("Setting Save"),
		message: Text("Settings successfully saved"),
		dismissButton: .default(Text("OK"))
	)

	static let unableToSaveSettings = AlertItem(
		title: Text("Setting Error"),
		message: Text("Unable to save settings, please contact support."),
		dismissButton: .default(Text("OK"))
	)

	static let unableToRetrieveSettings = AlertItem(
		title: Text("Setting Error"),
		message: Text("Unable to retrieve settings, please contact support."),
		dismissButton: .default(Text("OK"))
	)
}
