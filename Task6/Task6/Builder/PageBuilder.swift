//
//  PageBuilder.swift
//  Task6
//
//  Created by Admin on 24.11.2020.
//

import Foundation
import UIKit

class PageBuilder : UIView {

	private var label1: UILabel {
		let label1 = UILabel()
		label1.numberOfLines = 1
		label1.textAlignment = .center
		label1.text = "Simple Label"
		return label1
	}

	private var label2: UILabel {
		let label2 = UILabel()
		label2.numberOfLines = 1
		label2.textAlignment = .center
		label2.font = UIFont.boldSystemFont(ofSize: FirstViewConstants.shared.labelFontSize)
		label2.text = "Different font"
		return label2
	}

	private var label3: UILabel {
		let label3 = UILabel()
		label3.numberOfLines = 2
		label3.numberOfLines = 2
		label3.textAlignment = .center
		label3.font = UIFont.italicSystemFont(ofSize: FirstViewConstants.shared.labelFontSize)
		label3.text = """
			Different font
			line 2
			line 3 (not visible)
			"""
		return label3
	}

	private var button1: UIButton {
		let button1 = UIButton(type: .custom)
		button1.layer.cornerRadius = FirstViewConstants.shared.bottomAndTopSpace
		button1.backgroundColor = FirstViewConstants.shared.backgroundButton1Color
		button1.clipsToBounds = true
		button1.setTitleColor(.black, for: .normal)
		button1.setTitle(FirstViewConstants.shared.firstButtonTitle, for: .normal)
		button2.titleLabel?.font = .boldSystemFont(ofSize: FirstViewConstants.shared.buttonFontSize)
		button1.layer.borderWidth = FirstViewConstants.shared.button1BorderWidth
		button1.layer.borderColor = FirstViewConstants.shared.borderButton1Color
		return button1
	}

	private var button2: UIButton {
		let button2 = UIButton(type: .custom)
		button2.backgroundColor = FirstViewConstants.shared.backgroundButton2Color
		button2.clipsToBounds = true
		button2.setTitleColor(.black, for: .normal)
		button2.setTitle(FirstViewConstants.shared.secondButtonTitle, for: .normal)
		button2.titleLabel?.font = .italicSystemFont(ofSize: FirstViewConstants.shared.buttonFontSize)
		button2.layer.borderWidth = FirstViewConstants.shared.button2BorderWidth
		button2.layer.borderColor = FirstViewConstants.shared.borderButton2Color
		return button2
	}

	private var imageView: UIImageView {
		let imageView = UIImageView()
		imageView.image = Images.test.image
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}

	private var activityIndicator: UIActivityIndicatorView {
		let activityIndicator = UIActivityIndicatorView()
		activityIndicator.color = .black
		activityIndicator.startAnimating()
		return activityIndicator
	}

	//MARK: Subviews
	
	func addLabel1() -> Self {
		addSubview(label1)
		label1.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label1.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label1.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label1.topAnchor.constraint(
				equalTo: safeAreaLayoutGuide.topAnchor, constant: FirstViewConstants.shared.bottomAndTopSpace),
			label1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: FirstViewConstants.shared.label1HeightRelativeToSafeArea)])
		return self
	}

	func addLabel2() -> Self {
		addSubview(label2)
		label2.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label2.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label2.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label2.topAnchor.constraint(
				equalTo: label1.bottomAnchor),
			label2.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: FirstViewConstants.shared.label2HeightRelativeToSafeArea)
		])
		return self
	}

	func addLabel3() -> Self {
		addSubview(label3)
		label3.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label3.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label3.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label3.topAnchor.constraint(
				equalTo: label2.bottomAnchor),
			label3.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: FirstViewConstants.shared.label3HeightRelativeToSafeArea)
		])
		return self
	}

	func addButton1() -> Self {
		addSubview(button1)
		button1.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			button1.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor),
			button1.topAnchor.constraint(
				equalTo: label3.bottomAnchor),
			button1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: FirstViewConstants.shared.button1HeightRelativeToSafeArea),
			button1.widthAnchor.constraint(
				equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: FirstViewConstants.shared.button1WidthRelativeToSafeArea)
		])
		return self
	}

	func addButton2() -> Self {
		addSubview(button2)
		button2.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			button2.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: FirstViewConstants.shared.button2HeightRelativeToSafeArea),
			button2.widthAnchor.constraint(
				equalTo: button2.heightAnchor),
			button2.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor),
			button2.topAnchor.constraint(
				equalTo: button1.bottomAnchor, constant: FirstViewConstants.shared.spaceBetweenButtons
			),
		])
		return self
	}

	func addImageView() -> Self {
		addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(
				equalTo: button2.bottomAnchor, constant: FirstViewConstants.shared.spaceBetweenButtons),
			imageView.bottomAnchor.constraint(
				equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -FirstViewConstants.shared.bottomAndTopSpace),
			imageView.widthAnchor.constraint(
				equalTo: imageView.heightAnchor),
			imageView.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor)
		])
		return self
	}

	func addActivityIndicator() -> Self {
		imageView.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			activityIndicator.centerYAnchor.constraint(
				equalTo: imageView.centerYAnchor),
			activityIndicator.centerXAnchor.constraint(
				equalTo: imageView.centerXAnchor)
		])
		return self
	}

	func build() -> Self {
		return self
	}
}
