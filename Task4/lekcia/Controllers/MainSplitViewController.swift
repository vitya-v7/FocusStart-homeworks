//
//  MainSplitViewController.swift
//  lekcia
//
//  Created by Admin on 08.11.2020.
//

import UIKit

class MainSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.delegate = self
		self.preferredDisplayMode = .oneBesideSecondary
		self.navigationItem.title = "privet"
		// Do any additional setup after loading the view.
	}

	/*func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
		return .primary
	}*/

	@available(iOS 14.0, *)
	func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
		return .primary
	}

}
