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
		self.preferredDisplayMode = .allVisible
		// Do any additional setup after loading the view.
	}

	/*func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
		return .primary
	}*/

	func splitViewController(
		_ splitViewController: UISplitViewController,
		collapseSecondary secondaryViewController: UIViewController,
		onto primaryViewController: UIViewController) -> Bool {
		// Return true to prevent UIKit from applying its default behavior
		return true
	}

}
