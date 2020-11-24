//
//  MyViewController.swift
//  Task6
//
//  Created by Admin on 24.11.2020.
//

import UIKit

class MyViewController: UIViewController {

	// MARK: Life Cycle

	private let builder = PageBuilder()

	override func loadView() {
		view = builder.addLabel1().addLabel2().addLabel3().addButton1().addButton2().addImageView().addActivityIndicator().build()
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
	}
}
