//
//  ThirdViewController.swift
//  Task3
//
//  Created by Admin on 03.11.2020.
//

import UIKit

class ThirdViewController: UIViewController {

	// MARK: Life Cycle
	
	private let myView = ThirdView(frame: .zero)
	
	override func loadView() {
		myView.tabBarHeight = tabBarController?.tabBar.frame.height
		view = myView
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		myView.makeButtonRounded()
	}
}
