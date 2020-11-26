//
//  PageViewBuilder.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class PageViewBuilder: UIView {

	//MARK: Constants

	private enum Constants
	{
		static let firstButtonTitle = "Button1"
		static let secondButtonTitle = "Button2"

		static let imageViewHeightRelativeToSafeArea: CGFloat = 0.20

		static let bottomAndTopSpace: CGFloat = 5
		static let labelFontSize: CGFloat = 14

		static let buttonFontSize: CGFloat = 10
		static let button1BorderWidth: CGFloat = 1
		static let backgroundButton1Color = UIColor.cyan
		static let borderButton1Color = UIColor.systemRed.cgColor
		static let button1HeightRelativeToSafeArea: CGFloat = 0.10
		static let button1WidthRelativeToSafeArea: CGFloat = 0.7

		static let button2HeightRelativeToSafeArea: CGFloat = 0.10
		static let button2BorderWidth: CGFloat = 1
		static let backgroundButton2Color = UIColor.systemRed
		static let borderButton2Color = UIColor.systemGreen.cgColor

		static let label1HeightRelativeToSafeArea: CGFloat = 0.05
		static let label2HeightRelativeToSafeArea: CGFloat = 0.15
		static let label3HeightRelativeToSafeArea: CGFloat = 0.26
	}

	// MARK: Views

	var firstElement: UIView?
	var lastElement: UIView?
	var topSubview: UIView?

	private let label1 = UILabel()
	private let label2 = UILabel()
	private let label3 = UILabel()
	private let button1 = UIButton(type: .custom)
	private let button2 = UIButton(type: .custom)
	private let imageView = UIImageView()
	private let activityIndicator = UIActivityIndicatorView()

	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PageViewBuilder
{
	// MARK: Configuring Subviews

	func configureSuperView() {
		backgroundColor = .systemBackground
	}

	func configureLabel1() {
		label1.numberOfLines = 1
		label1.textAlignment = .center
		label1.text = "Simple Label"
	}

	func configureLabel2() {
		label2.numberOfLines = 1
		label2.textAlignment = .center
		label2.font = UIFont.boldSystemFont(ofSize: Constants.labelFontSize)
		label2.text = "Different font"
	}

	func configureLabel3() {
		label3.numberOfLines = 2
		label3.textAlignment = .center
		label3.font = UIFont.italicSystemFont(ofSize: Constants.labelFontSize)
		label3.text = """
			Different font
			line 2
			line 3 (not visible)
			"""
	}

	func configureButton1() {
		button1.layer.cornerRadius = Constants.bottomAndTopSpace
		button1.backgroundColor = Constants.backgroundButton1Color
		button1.clipsToBounds = true
		button1.setTitleColor(.black, for: .normal)
		button1.setTitle(Constants.firstButtonTitle, for: .normal)
		button2.titleLabel?.font = .boldSystemFont(ofSize: Constants.buttonFontSize)
		button1.layer.borderWidth = Constants.button1BorderWidth
		button1.layer.borderColor = Constants.borderButton1Color
	}

	func configureButton2() {
		button2.backgroundColor = Constants.backgroundButton2Color
		button2.clipsToBounds = true
		button2.setTitleColor(.black, for: .normal)
		button2.setTitle(Constants.secondButtonTitle, for: .normal)
		button2.titleLabel?.font = .italicSystemFont(ofSize: Constants.buttonFontSize)
		button2.layer.borderWidth = Constants.button2BorderWidth
		button2.layer.borderColor = Constants.borderButton2Color
	}

	func configureImageView() {
		imageView.image = Images.test.image
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
	}

	func configureActivityIndicator() {
		activityIndicator.color = .black
		activityIndicator.startAnimating()
	}

	// MARK: Constraints

	func setTopAnchor() -> NSLayoutYAxisAnchor {
		var anchor: NSLayoutYAxisAnchor
		if let topAnchor = topSubview?.bottomAnchor {
			anchor = topAnchor
		}
		else {
			anchor = safeAreaLayoutGuide.topAnchor
		}
		return anchor
	}

	func setupLabel1Constraints() {
		addSubview(label1)
		label1.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			label1.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label1.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label1.topAnchor.constraint(
				equalTo: anchor, constant: Constants.bottomAndTopSpace),
			label1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.label1HeightRelativeToSafeArea)])
	}

	func setupLabel2Constraints() {
		addSubview(label2)
		label2.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			label2.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label2.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label2.topAnchor.constraint(
				equalTo: anchor, constant: Constants.bottomAndTopSpace),
			label2.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.label2HeightRelativeToSafeArea)
		])
	}

	func setupLabel3Constraints() {
		addSubview(label3)
		label3.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			label3.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label3.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label3.topAnchor.constraint(
				equalTo: anchor, constant: Constants.bottomAndTopSpace),
			label3.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.label3HeightRelativeToSafeArea)
		])
	}

	func setupButton1Constraints() {
		addSubview(button1)
		button1.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			button1.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor),
			button1.topAnchor.constraint(
				equalTo: anchor, constant: Constants.bottomAndTopSpace),
			button1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.button1HeightRelativeToSafeArea),
			button1.widthAnchor.constraint(
				equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: Constants.button1WidthRelativeToSafeArea)
		])
	}

	func setupButton2Constraints() {
		addSubview(button2)
		button2.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			button2.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.button2HeightRelativeToSafeArea),
			button2.widthAnchor.constraint(
				equalTo: button2.heightAnchor),
			button2.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor),
			button2.topAnchor.constraint(
				equalTo: anchor, constant: Constants.bottomAndTopSpace
			),
		])
	}

	func setupImageViewConstraints() {
		addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(
				equalTo: anchor, constant: Constants.bottomAndTopSpace),
			imageView.heightAnchor.constraint(
				equalTo: layoutMarginsGuide.heightAnchor, multiplier: Constants.imageViewHeightRelativeToSafeArea),
			imageView.widthAnchor.constraint(
				equalTo: imageView.heightAnchor),
			imageView.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor)
		])
	}

	func setupActivityIndicatorConstraints() {
		if subviews.contains(imageView) {
		imageView.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([
				activityIndicator.centerYAnchor.constraint(
					equalTo: imageView.centerYAnchor),
				activityIndicator.centerXAnchor.constraint(
					equalTo: imageView.centerXAnchor)
			])
		}
	}

	func addLabel1() -> Self  {
		configureLabel1()
		setupLabel1Constraints()
		topSubview = label1
		lastElement = label1
		return self
	}

	func addLabel2() -> Self  {
		configureLabel2()
		setupLabel2Constraints()
		topSubview = label2
		lastElement = label2
		return self
	}

	func addLabel3() -> Self {
		configureLabel3()
		setupLabel3Constraints()
		topSubview = label3
		lastElement = label3
		return self
	}

	func addButton1() -> Self {
		configureButton1()
		setupButton1Constraints()
		topSubview = button1
		lastElement = button1
		return self
	}

	func addButton2() -> Self {
		configureButton2()
		setupButton2Constraints()
		topSubview = button2
		lastElement = button2
		return self
	}

	func addImageView() -> Self {
		configureImageView()
		setupImageViewConstraints()
		topSubview = imageView
		lastElement = imageView
		return self
	}

	func addActivityIndicator() -> Self {
		if subviews.contains(imageView) {
			configureActivityIndicator()
			setupActivityIndicatorConstraints()
			topSubview = activityIndicator
			lastElement = imageView
			return self
		}
		return self
	}

	func build() -> Self {
		if let lastElement = lastElement {
			NSLayoutConstraint.activate([
				lastElement.bottomAnchor.constraint(
					greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor,
					constant: -Constants.bottomAndTopSpace),
			])
		}
		return self
	}
}
