//
//  ExposureData.swift
//  exposure-vic
//
//  Created by Mark Battistella on 15/8/21.
//

import SwiftUI

struct ExposureData {
	
	// method
	func getExposureData() {
		
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
//			guard let data = data else { return }
			
			if let data = data {
				if let returnData = self.parseJSON(data) {
					self.delegate?.didUpdateWeather(self, weather: returnData)
				}
			}

		}
		
		// 4. start the task
		task.resume()
		semaphore.wait()
	}




	func parseJSON(_ exposureData: Data) -> ExposureDataModel? {
		
		let decoder = JSONDecoder()
		
		do {
			//
			let decodedData = try decoder.decode(ExposureDataModel.self, from: exposureData)
			
			//
			let exposureSiteRecords = ExposureDataModel.Record(
				id: decodedData.result.records[0].id,
				suburb: decodedData.result.records[0].suburb,
				siteTitle: decodedData.result.records[0].siteTitle,
				siteStreetaddress: decodedData.result.records[0].siteStreetaddress,
				siteState: decodedData.result.records[0].siteState,
				sitePostcode: decodedData.result.records[0].sitePostcode,
				exposureDateDtm: decodedData.result.records[0].exposureDateDtm,
				exposureDate: decodedData.result.records[0].exposureDate,
				exposureTime: decodedData.result.records[0].exposureTime,
				notes: decodedData.result.records[0].notes,
				addedDateDtm: decodedData.result.records[0].addedDateDtm,
				addedDate: decodedData.result.records[0].addedDate,
				addedTime: decodedData.result.records[0].addedTime,
				adviceTitle: decodedData.result.records[0].adviceTitle,
				adviceInstruction: decodedData.result.records[0].adviceInstruction,
				exposureTimeStart24: decodedData.result.records[0].exposureTimeStart24,
				exposureTimeEnd24: decodedData.result.records[0].exposureTimeEnd24
			)
			
			//
			let exposureSiteResults = ExposureDataModel.Result(
				records: [exposureSiteRecords],
				total: decodedData.result.total
			)

			//
			let modelData = ExposureDataModel(result: exposureSiteResults)
			
			return modelData

		} catch {

			// return nil for optional
			return nil
		}
	}
}

