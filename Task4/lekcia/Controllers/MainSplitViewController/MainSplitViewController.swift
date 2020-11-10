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
		
	}

	func splitViewController(
		_ splitViewController: UISplitViewController,
		collapseSecondary secondaryViewController: UIViewController,
		onto primaryViewController: UIViewController) -> Bool {
		return true
	}

}
