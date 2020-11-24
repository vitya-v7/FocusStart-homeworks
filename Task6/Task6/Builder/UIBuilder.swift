//
//  UIBuilder.swift
//  Task6
//
//  Created by Admin on 24.11.2020.
//

import Foundation
import UIKit

class PageBuilder {

	private let label1: UILabel {
		label1.numberOfLines = 1
		label1.textAlignment = .center
		label1.text = "Simple Label"
	}
	private var label2: UILabel {
		label2.numberOfLines = 1
		label2.textAlignment = .center
		label2.font = UIFont.boldSystemFont(ofSize: Constants.labelFontSize)
		label2.text = "Different font"
	}
	private var label3: UILabel { label3.numberOfLines = 2
		label3.textAlignment = .center
		label3.font = UIFont.italicSystemFont(ofSize: Constants.labelFontSize)
		label3.text = """
			Different font
			line 2
			line 3 (not visible)
			"""
	}
	//private let button1: UIButton(type: .custom)  { }
	//private let button2: UIButton(type: .custom) { }
	//private let imageView: UIImageView() { }
	//private let activityIndicator: UIActivityIndicatorView() { }

	func addLabel1() {

	}

	func addLabel2() {

	}

	func addLabel3() {

	}

	func addButton1() {

	}

	func addButton2() {

	}

	func addImageView() {
		
	}

	func addActivityIndicator() {

	}
}
