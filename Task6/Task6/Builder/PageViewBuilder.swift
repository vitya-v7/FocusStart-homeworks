//
//  PageViewBuilder.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class PageViewBuilder: UIView {

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
		label2.font = UIFont.boldSystemFont(ofSize: Constants.shared.labelFontSize)
		label2.text = "Different font"
	}

	func configureLabel3() {
		label3.numberOfLines = 2
		label3.textAlignment = .center
		label3.font = UIFont.italicSystemFont(ofSize: Constants.shared.labelFontSize)
		label3.text = """
			Different font
			line 2
			line 3 (not visible)
			"""
	}

	func configureButton1() {
		button1.layer.cornerRadius = Constants.shared.bottomAndTopSpace
		button1.backgroundColor = Constants.shared.backgroundButton1Color
		button1.clipsToBounds = true
		button1.setTitleColor(.black, for: .normal)
		button1.setTitle(Constants.shared.firstButtonTitle, for: .normal)
		button2.titleLabel?.font = .boldSystemFont(ofSize: Constants.shared.buttonFontSize)
		button1.layer.borderWidth = Constants.shared.button1BorderWidth
		button1.layer.borderColor = Constants.shared.borderButton1Color
	}

	func configureButton2() {
		button2.backgroundColor = Constants.shared.backgroundButton2Color
		button2.clipsToBounds = true
		button2.setTitleColor(.black, for: .normal)
		button2.setTitle(Constants.shared.secondButtonTitle, for: .normal)
		button2.titleLabel?.font = .italicSystemFont(ofSize: Constants.shared.buttonFontSize)
		button2.layer.borderWidth = Constants.shared.button2BorderWidth
		button2.layer.borderColor = Constants.shared.borderButton2Color
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
				equalTo: anchor, constant: Constants.shared.bottomAndTopSpace),
			label1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.shared.label1HeightRelativeToSafeArea)])
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
				equalTo: anchor, constant: Constants.shared.bottomAndTopSpace),
			label2.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.shared.label2HeightRelativeToSafeArea)
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
				equalTo: anchor, constant: Constants.shared.bottomAndTopSpace),
			label3.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.shared.label3HeightRelativeToSafeArea)
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
				equalTo: anchor, constant: Constants.shared.bottomAndTopSpace),
			button1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.shared.button1HeightRelativeToSafeArea),
			button1.widthAnchor.constraint(
				equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: Constants.shared.button1WidthRelativeToSafeArea)
		])
	}

	func setupButton2Constraints() {
		addSubview(button2)
		button2.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			button2.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: Constants.shared.button2HeightRelativeToSafeArea),
			button2.widthAnchor.constraint(
				equalTo: button2.heightAnchor),
			button2.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor),
			button2.topAnchor.constraint(
				equalTo: anchor, constant: Constants.shared.bottomAndTopSpace
			),
		])
	}

	func setupImageViewConstraints() {
		addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		let anchor = setTopAnchor()
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(
				equalTo: anchor, constant: Constants.shared.bottomAndTopSpace),
			imageView.heightAnchor.constraint(
				equalTo: layoutMarginsGuide.heightAnchor, multiplier: Constants.shared.imageViewHeightRelativeToSafeArea),
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
					constant: Constants.shared.bottomAndTopSpace),
			])
		}
		return self
	}
}
