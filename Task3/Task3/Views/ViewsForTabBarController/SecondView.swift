//
//  SecondView.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class SecondView: UIView {
	
	// MARK: Properties

	private struct Constants
	{
		static let imageViewHeight: CGFloat = 300
		static let imageMargin: CGFloat = 12
		static let labelSpace: CGFloat = 15
	}

	private var isLayoutCompact = false

	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

	// MARK: Views

	private let scrollView = UIScrollView()
	private let imageView = UIImageView()
	private let titleLabel = UILabel()
	private let textLabel = UILabel()

	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)
		configureSubviews()
		setupConstraints()
		changeViewsLayout(traitCollection: traitCollection)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Changes Cycle

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		changeViewsLayout(traitCollection: traitCollection)
	}
}

// MARK: Configuring Subviews

private extension SecondView
{
	func configureSubviews() {
		configureSuperView()
		configureImageView()
		configureTitleLabel()
		configureTextLabel()
	}

	func configureSuperView() {
		backgroundColor = .systemBackground
	}

	func configureImageView() {
		imageView.image = Images.test.image
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
	}
	func configureTitleLabel() {
		titleLabel.numberOfLines = 1
		titleLabel.textAlignment = .center
		titleLabel.font = .boldSystemFont(ofSize: 25)
		titleLabel.text = "Header"
	}

	func configureTextLabel() {
		textLabel.numberOfLines = 0
		textLabel.text =
			"""
			Text Text Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text TextText Text Text Text Text Text Text Text Text
			Text Text Text Text Text Text Text Text Text
			"""
		textLabel.textAlignment = .center
	}
}

// MARK: Shared Constraints

private extension SecondView
{
	func changeViewsLayout(traitCollection: UITraitCollection) {
		switch(traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.compact, .regular):
			guard isLayoutCompact == false else { return }
			isLayoutCompact = true
			NSLayoutConstraint.deactivate(regularConstraints)
			NSLayoutConstraint.activate(compactConstraints)
		default:
			guard isLayoutCompact == true else { return }
			isLayoutCompact = false
			NSLayoutConstraint.deactivate(compactConstraints)
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	func setupConstraints() {
		setupSharedConstraints()
		setupCompactConstraints()
		setupRegularConstraints()
	}

	func setupSharedConstraints() {
		setupScrollViewConstraints()
		setupImageViewConstraints()
		setupTitleLabelConstraints()
		setupTextLabelConstraints()

		NSLayoutConstraint.activate(sharedConstraints)
	}

	func setupScrollViewConstraints() {

		addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			scrollView.centerXAnchor.constraint(
				equalTo: centerXAnchor),
			scrollView.topAnchor.constraint(
				equalTo: safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(
				equalTo: safeAreaLayoutGuide.bottomAnchor),
			scrollView.widthAnchor.constraint(
				equalTo: safeAreaLayoutGuide.widthAnchor)
		])
	}

	func setupImageViewConstraints() {
		scrollView.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			imageView.topAnchor.constraint(
				equalTo: scrollView.topAnchor, constant: Constants.imageMargin),
			imageView.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.imageMargin),
			imageView.heightAnchor.constraint(
				equalToConstant: Constants.imageViewHeight)
		])
	}

	func setupTitleLabelConstraints() {
		scrollView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			titleLabel.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -Constants.labelSpace)
		])
	}

	func setupTextLabelConstraints() {
		scrollView.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			textLabel.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -Constants.labelSpace),
			textLabel.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.labelSpace),
			textLabel.bottomAnchor.constraint(
				equalTo: scrollView.bottomAnchor)
		])
	}
}

// MARK: Compact Constraints

private extension SecondView
{
	func setupCompactConstraints() {
		setupImageViewCompactConstraints()
		setupTitleLabelCompactConstraints()
		setupTextLabelCompactConstraints()
	}

	func setupImageViewCompactConstraints() {
		compactConstraints.append(contentsOf: [
			imageView.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.imageMargin),
		])
	}

	func setupTitleLabelCompactConstraints() {
		compactConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.labelSpace),
			titleLabel.topAnchor.constraint(
				equalTo: imageView.bottomAnchor,
				constant: Constants.labelSpace)
		])
	}

	func setupTextLabelCompactConstraints() {
		compactConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(
				equalTo: titleLabel.bottomAnchor,
				constant: Constants.labelSpace)
		])
	}
}

// MARK: Regular Constraints

private extension SecondView
{
	func setupRegularConstraints() {
		setupImageViewRegularConstraints()
		setupTitleLabelRegularConstraints()
		setupTextLabelRegularConstraints()
	}

	func setupImageViewRegularConstraints() {
		regularConstraints.append(contentsOf: [
			imageView.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.imageMargin),
			imageView.trailingAnchor.constraint(
				equalTo: textLabel.leadingAnchor,
				constant: -Constants.imageMargin),
			imageView.widthAnchor.constraint(
				equalToConstant: Constants.imageViewHeight)
		])
	}

	func setupTitleLabelRegularConstraints() {
		regularConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(
				equalTo: imageView.trailingAnchor,
				constant: Constants.labelSpace),
			titleLabel.centerYAnchor.constraint(
				equalTo: imageView.centerYAnchor)
		])
	}

	func setupTextLabelRegularConstraints() {
		regularConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(
				equalTo: imageView.bottomAnchor,
				constant: Constants.labelSpace)
		])
	}
}
