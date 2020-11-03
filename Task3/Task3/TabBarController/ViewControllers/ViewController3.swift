//
//  ViewController3.swift
//  Task3
//
//  Created by Admin on 03.11.2020.
//

import UIKit

class ViewController3: UIViewController {

	// MARK: Life Cycle
	
	var myView: View3 = View3(frame: .zero)
	
	override func loadView() {
		myView.tabBarHeight = tabBarController?.tabBar.frame.height
		view = myView
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		myView.makeButtonRounded()
	}
}
