//
//  PullToRefresh.swift
//  exposure-vic
//
//  Created by Mark Battistella on 18/8/21.
//

import SwiftUI

struct PullToRefresh: UIViewRepresentable {
	
	let action: () -> Void
	@Binding var isRefreshing: Bool
	
	public init(
		action: @escaping () -> Void,
		isRefreshing: Binding<Bool>
	) {
		self.action = action
		_isRefreshing = isRefreshing
	}
	
	public class Coordinator {
		let action: () -> Void
		let isRefreshing: Binding<Bool>
		
		init(
			action: @escaping () -> Void,
			isRefreshing: Binding<Bool>
		) {
			self.action = action
			self.isRefreshing = isRefreshing
		}
		
		@objc
		func onValueChanged() {
			isRefreshing.wrappedValue = true
			action()
		}
	}
	
	public func makeUIView(context: UIViewRepresentableContext<PullToRefresh>) -> UIView {
		return UIView(frame: .zero)
	}
	
	private func tableView(root: UIView) -> UITableView? {
		for subview in root.subviews {
			if let tableView = subview as? UITableView {
				return tableView
			} else if let tableView = tableView(root: subview) {
				return tableView
			}
		}
		return nil
	}
	
	public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PullToRefresh>) {
		
		DispatchQueue.main.asyncAfter(deadline: .now()) {
			guard let viewHost = uiView.superview?.superview else {
				return
			}
			guard let tableView = self.tableView(root: viewHost) else {
				return
			}
			
			if let refreshControl = tableView.refreshControl {
				if self.isRefreshing {
					refreshControl.beginRefreshing()
				} else {
					refreshControl.endRefreshing()
				}
				return
			}
			
			let refreshControl = UIRefreshControl()
			refreshControl.addTarget(context.coordinator, action: #selector(Coordinator.onValueChanged), for: .valueChanged)
			tableView.refreshControl = refreshControl
		}
	}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(action: action, isRefreshing: $isRefreshing)
	}
}
