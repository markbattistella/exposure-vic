//
//  ErrorType.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import Foundation

enum NetworkErrorType: Error {
	case invalidURL
	case invalidResponse
	case invalidData
	case unableToComplete
}
