//
//  MyViewController.swift
//  Task6
//
//  Created by Admin on 24.11.2020.
//

import UIKit

class MyViewController: UIViewController {

	// MARK: Life Cycle

	private let myView = MyView(frame: .zero)

	override func loadView() {
		view = myView
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
	}
}
