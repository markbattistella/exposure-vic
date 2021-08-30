//
//  NetworkManager.swift
//  exposure-vic
//
//  Created by Mark Battistella on 16/8/21.
//

import Foundation

final class NetworkManager {
	
	// initialise the network manager
	static let shared = NetworkManager()
	
	// get the base url
	// -- server parsed
	private let baseURL = "https://markbattistella.github.io/exposure-vic-api/datavic.json"
	
	// initialise the class
	private init() {}
	
	// network call to get the data
	func getExposureSites(completed: @escaping (Result<[ExposureDataModel], ErrorType>) -> Void) {
		
		// unwrap the url
		guard let url = URL(string: baseURL) else {
			completed(.failure(.invalidURL))
			return
		}
		
		// run the call
		let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error  in
			
			// unwrap the error
			if let _ = error {
				completed(.failure(.unableToComplete))
				return
			}
			
			// unwrap the response
			guard let response = response as? HTTPURLResponse,
				  response.statusCode == 200 else {
				completed(.failure(.invalidResponse))
				return
			}
			
			// unwrap the data
			guard let data = data else {
				completed(.failure(.invalidData))
				return
			}
			
			// do-catch if all else is good
			do {
				
				// initialise a json decoder
				let decoder = JSONDecoder()
				
				// try to decode the data into the ExposureModel
				let decodedResponse = try decoder.decode([ExposureDataModel].self, from: data)
				
				// run the success
				completed(.success(decodedResponse))
				
			} catch {
				
				// return error
				completed(.failure(.invalidData))
			}
		}
		
		// 4. start the task
		task.resume()
	}
}
