//
//  FirstView.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class FirstView: UIView {

	// MARK: Properties

	private var Constraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

	// MARK: Views

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

		configureSubviews()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func makeButton2Rounded() {
		let minimum = min(button2.bounds.height, button2.bounds.width)
		button2.layer.cornerRadius = minimum/2
	}
}

private extension FirstView
{
	// MARK: Configuring Subviews

	func configureSubviews() {
		configureSuperView()
		configureImageView()
		configureLabel1()
		configureLabel2()
		configureLabel3()
		configureButton1()
		configureButton2()
		configureActivityIndicator()
	}

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
		label2.font = UIFont.boldSystemFont(ofSize: FirstViewConstants.shared.labelFontSize)
		label2.text = "Different font"
	}

	func configureLabel3() {
		label3.numberOfLines = 2
		label3.textAlignment = .center
		label3.font = UIFont.italicSystemFont(ofSize: FirstViewConstants.shared.labelFontSize)
		label3.text = """
            Different font
            line 2
            line 3 (not visible)
            """
	}

	func configureButton1() {
		button1.layer.cornerRadius = FirstViewConstants.shared.bottomAndTopSpace
		button1.backgroundColor = FirstViewConstants.shared.backgroundButton1Color
		button1.clipsToBounds = true
		button1.setTitleColor(.black, for: .normal)
		button1.setTitle(FirstViewConstants.shared.firstButtonTitle, for: .normal)
		button2.titleLabel?.font = .boldSystemFont(ofSize: FirstViewConstants.shared.buttonFontSize)
		button1.layer.borderWidth = FirstViewConstants.shared.button1BorderWidth
		button1.layer.borderColor = FirstViewConstants.shared.borderButton1Color
	}

	func configureButton2() {
		button2.backgroundColor = FirstViewConstants.shared.backgroundButton2Color
		button2.clipsToBounds = true
		button2.setTitleColor(.black, for: .normal)
		button2.setTitle(FirstViewConstants.shared.secondButtonTitle, for: .normal)
		button2.titleLabel?.font = .italicSystemFont(ofSize: FirstViewConstants.shared.buttonFontSize)
		button2.layer.borderWidth = FirstViewConstants.shared.button2BorderWidth
		button2.layer.borderColor = FirstViewConstants.shared.borderButton2Color
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

	func setupConstraints() {
		setupLabel1Constraints()
		setupLabel2Constraints()
		setupLabel3Constraints()
		setupButton1Constraints()
		setupButton2Constraints()
		setupImageViewConstraints()
		setupActivityIndicatorConstraints()
		NSLayoutConstraint.activate(Constraints)
	}

	func setupLabel1Constraints() {
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
	}

	func setupLabel2Constraints() {
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
	}

	func setupLabel3Constraints() {
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
	}

	func setupButton1Constraints() {
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
	}

	func setupButton2Constraints() {
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
	}

	func setupImageViewConstraints() {
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
	}

	func setupActivityIndicatorConstraints() {
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
