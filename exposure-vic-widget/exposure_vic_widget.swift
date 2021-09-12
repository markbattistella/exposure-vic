//
//  exposure_vic_widget.swift
//  exposure-vic-widget
//
//  Created by Mark Battistella on 12/9/21.
//

import WidgetKit
import SwiftUI
import Intents

struct ExposureTimelineEntry: TimelineEntry {
	let date: Date
	let configuration: ConfigurationIntent
	let exposures: [DataModel]
}

struct Provider: IntentTimelineProvider {
	private let dummyEntry = ExposureTimelineEntry(
		date: Date(),
		configuration: ConfigurationIntent(),
		exposures: MockDataModel.mockExposuresArray
	)
	
	// when in preview mode
	func placeholder(in context: Context) -> ExposureTimelineEntry {
		return ExposureTimelineEntry(
			date: Date(),
			configuration: ConfigurationIntent(),
			exposures: MockDataModel.mockExposuresArray
		)
	}
	
	// when in transient modes
	func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ExposureTimelineEntry) -> ()) {
		let entry = ExposureTimelineEntry(
			date: Date(),
			configuration: configuration,
			exposures: MockDataModel.mockExposuresArray
		)
		completion(entry)
	}
	
	// the actual view
	func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
		NetworkManager.shared.getExposureSites { result in
			switch result {
				case .success(let exposures):
					let entry = ExposureTimelineEntry(date: Date(), configuration: configuration, exposures: exposures)
					let _30Minutes = Date().addingTimeInterval(1800)
					let timeline = Timeline(
						entries: [entry],
						policy: TimelineReloadPolicy.after(_30Minutes)
					)
					completion(timeline)
					
				case .failure(let error):
					print(error)
			}
		}
	}
}

struct WidgetEntryView: View {
	
	// get the size
	@Environment(\.widgetFamily) var family
	@Environment(\.colorScheme) var colorScheme
	
	// what to pass in
	let entry: Provider.Entry
	
	private var isFiltering: Bool {
		guard let filtering = entry.configuration.filtering else { return false }
		return filtering.boolValue
	}
	private var filteredPostcode: String {
		guard let postcode = entry.configuration.postcode else { return "0" }
		return isFiltering ? "\(postcode)" : ""
	}
	
	private var numberOfResults: Int {
		switch family {
			case .systemSmall: return 0
			case .systemMedium: return 2
			case .systemLarge: return 5
			@unknown default: return 0
		}
	}
	
	var body: some View {

		VStack(alignment: .leading) {
			
			// no exposures to show!
			if(entry.exposures.count == 0) {
				Text("No exposures!")
				
			// there are places to show
			} else {
				
				let filtered = entry.exposures.filter({ !isFiltering ? true :
					$0.sitePostcode?.contains(filteredPostcode) as! Bool
				}).prefix( numberOfResults )
				
				if(filtered.count > 0) {
					ForEach(filtered) { exposure in
						ExposureWidgetRow(exposure: exposure)
					}
				} else {
					Text("No results for the postcode \(filteredPostcode)")
						.font(.caption2)
						.bold()
				}
			}
		}
		.padding()
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			LinearGradient(
				gradient: Gradient(
					colors: colorScheme == .dark ?
						[ Color(red: 0/255, green: 4/255, blue: 40/255),
						  Color(red: 0/255, green: 78/255, blue: 146/255)
						] :
						[ Color(red: 109/255, green: 213/255, blue: 250/255),
						  Color(red: 255/255, green: 255/255, blue: 255/255)
						]
				),
				startPoint: .bottom,
				endPoint: .top
			)
		)
	}
}

struct ExposureWidgetRow: View {
	@Environment(\.colorScheme) var colorScheme
	let exposure: DataModel

	var body: some View {

		HStack(alignment:.center) {

			// exposure tier
			Image(systemName: "square.fill")
				.resizable()
				.foregroundColor(exposure.exposureColour)
				.frame(width: 11, alignment: .center)
			
			// the text
			VStack(alignment: .leading) {
				
				// -- title
				if let siteTitle = exposure.siteTitle {
					Text(siteTitle)
						.font(.caption)
						.bold()
				}
				
				// -- address
				if let address = exposure.siteStreetaddress {
					if let suburb = exposure.suburb,
					   let postcode = exposure.sitePostcode {
						Text("\(address) \(suburb) \(postcode)")
							.font(.caption2)
					}
				}
				
				// -- exposure date time
				if let exposureDate = exposure.exposureDate {
					if let exposureTime = exposure.exposureTime {
						Text("\(exposureDate) \(exposureTime.replacingOccurrences(of: " - ", with: "-"))")
							.font(.caption2)
							.scaleEffect(0.8, anchor: .leading)
					} else {
						Text("\(exposureDate)")
							.font(.caption2)
							.scaleEffect(0.8, anchor: .leading)
					}
				}
			}
			.foregroundColor(colorScheme == .dark ? .white : .black)
			.truncationMode(.tail)
			.frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
		}
		.padding(.bottom, 2)
	}
}


@main
struct ExposureVICWidget: Widget {
	private let kind = "exposure_vic_widget"
	
	var body: some WidgetConfiguration {
		IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider() ) { entry in
			WidgetEntryView(entry: entry)
		}
		.configurationDisplayName("Exposure VIC")
		.description("Enter postcodes to filter the results")
		.supportedFamilies([.systemMedium,.systemLarge])
	}
}
