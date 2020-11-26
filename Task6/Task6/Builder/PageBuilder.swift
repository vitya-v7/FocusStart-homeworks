//
//  PageBuilder.swift
//  Task6
//
//  Created by Admin on 25.11.2020.
//

import Foundation

class PageBuilder {

	private var label1 = false
	private var label2 = false
	private var label3 = false
	private var button1 = false
	private var button2 = false
	private var imageView = false
	private var activityIndicator = false
	
	func addLabel1() -> Self  {
		label1 = true
		return self
	}

	func addLabel2() -> Self  {
		label2 = true
		return self
	}

	func addLabel3() -> Self {
		label3 = true
		return self
	}

	func addButton1() -> Self {
		button1 = true
		return self
	}

	func addButton2() -> Self {
		button2 = true
		return self
	}

	func addImageView() -> Self {
		imageView = true
		return self
	}

	func addActivityIndicator() -> Self {
		activityIndicator = true
		return self
	}



	func build() -> PageBuilder {
		return Page()
	}
}
