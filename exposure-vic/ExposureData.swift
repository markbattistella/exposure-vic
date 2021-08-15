//
//  ExposureData.swift
//  exposure-vic
//
//  Created by Mark Battistella on 15/8/21.
//

import SwiftUI

struct ExposureData {
	
	// method
	func getExposureData( completion: @escaping ([ExposureDataModel]) -> () ) {
		
		// testing for call numbers for return
		let callLimit = 1
		
		// call the kernel only when needed
		let semaphore = DispatchSemaphore (value: 0)
		
		// 1. create the url
		guard let fetchURL = URL(string: "https://discover.data.vic.gov.au/api/3/action/datastore_search?resource_id=afb52611-6061-4a2b-9110-74c920bede77&limit=\(callLimit)") else { return }
		
		// 2. create a url request
		var request = URLRequest(url: fetchURL, timeoutInterval: .infinity)
		
		// -- set the request method type
		request.httpMethod = "GET"
		
		// 3. give the session a task
		let session = URLSession.shared
		let task = session.dataTask(with: request) { data, response, error in
			
			// if we have an error
			if error != nil {
				
				// print it to the console
				print( error! )
				
				// semaphore green light
				semaphore.signal()
				
				// exit function
				return
			}
			
			// print the http response code if not 200 OK
			if let httpResponse = response as? HTTPURLResponse,
			   httpResponse.statusCode != 200 {
				print("Token code: \(httpResponse.statusCode)")
			}
			
			
			// unwrap the returned data
			guard let data = data else { return }
			
			// semaphore green light
			semaphore.signal()
			
			// init the decoder
			let decoder = JSONDecoder()
			
			// decode the data
			do {
				
				// decode the returned data via the struct
				let returnData = try decoder.decode(ExposureDataModel.self, from: data)
				
				completion( [returnData] )
				
			} catch {
				
				// print error to console
				print( error )
				
			}
		}
		
		// 4. start the task
		task.resume()
		semaphore.wait()
	}
}
