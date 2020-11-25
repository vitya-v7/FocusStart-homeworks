//
//  MyViewController.swift
//  Task6
//
//  Created by Admin on 24.11.2020.
//

import UIKit

class MyViewController: UIViewController {

	// MARK: Life Cycle

	private let builder = PageViewBuilder()

	override func loadView() {
		let builder = PageViewBuilder()
		self.view = builder.addLabel1().addLabel2().addLabel3().addButton1().addButton2().addImageView().addActivityIndicator().build()
		//self.view = builder.addLabel1().addLabel2().addLabel3().addButton1().addButton2().addImageView().build()
		//self.view = builder.addLabel2().addButton1().addImageView().build()
		//self.view = builder.addImageView().build()
		//self.view = builder.build()
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
	}
}
