//
//  FirstViewController.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class FirstViewController: UIViewController {

	// MARK: Life Cycle
	
	private let myView = FirstView(frame: .zero)

	override func loadView() {
		view = myView
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		myView.makeButton2Rounded()
	}
}
