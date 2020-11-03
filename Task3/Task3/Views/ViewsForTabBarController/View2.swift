//
//  View2.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class View2: UIView {
	// MARK: Properties

	private var isLayoutCompact = true

	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

	private enum Constants: CGFloat {
		case imageViewHeight = 300
		case imageMargin = 12
		case labelSpace = 15
	}

	// MARK: Views

	private let scrollView = UIScrollView()
	private let imageView = UIImageView()
	private let titleLabel = UILabel()
	private let textLabel = UILabel()


	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)

		setupViewsAppearances()
		setupViewsLayout()
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

// MARK: Appearances

private extension View2 {
	func setupViewsAppearances() {
		setupSuperViewAppearances()
		setupImageViewAppearances()
		setupTitleLabelAppearances()
		setupTextLabelAppearances()
	}

	func setupSuperViewAppearances() {
		backgroundColor = .systemBackground
	}

	func setupImageViewAppearances() {
		imageView.image = Images.test.image
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
	}
	func setupTitleLabelAppearances() {
		titleLabel.numberOfLines = 1
		titleLabel.textAlignment = .center
		titleLabel.font = .boldSystemFont(ofSize: 25)
		titleLabel.text = "Header"
	}

	func setupTextLabelAppearances() {
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

// MARK: Shared Layout

private extension View2 {

	func changeViewsLayout(traitCollection: UITraitCollection) {
		switch(traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.compact, .regular):
			isLayoutCompact = true
			NSLayoutConstraint.deactivate(regularConstraints)
			NSLayoutConstraint.activate(compactConstraints)
		default:
			guard isLayoutCompact != false else { return }

			isLayoutCompact = false
			NSLayoutConstraint.deactivate(compactConstraints)
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	func setupViewsLayout() {
		setupSharedLayout()
		setupCompactLayout()
		setupRegularLayout()
	}

	func setupSharedLayout() {
		setupScrollViewLayout()
		setupImageViewLayout()
		setupTitleLabelLayout()
		setupTextLabelLayout()

		NSLayoutConstraint.activate(sharedConstraints)
	}

	func setupScrollViewLayout() {

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

	func setupImageViewLayout() {
		scrollView.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			imageView.topAnchor.constraint(
				equalTo: scrollView.topAnchor, constant: Constants.imageMargin.rawValue),
			imageView.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.imageMargin.rawValue),
			imageView.heightAnchor.constraint(
				equalToConstant: Constants.imageViewHeight.rawValue)
		])
	}

	func setupTitleLabelLayout() {
		scrollView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			titleLabel.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -Constants.labelSpace.rawValue)
		])
	}

	func setupTextLabelLayout() {
		scrollView.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			textLabel.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor,
				constant: -Constants.labelSpace.rawValue),
			textLabel.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.labelSpace.rawValue),
			textLabel.bottomAnchor.constraint(
				equalTo: scrollView.bottomAnchor)
		])
	}
}

// MARK: Compact Layout

private extension View2 {
	func setupCompactLayout() {
		setupImageViewCompactLayout()
		setupTitleLabelCompactLayout()
		setupTextLabelCompactLayout()
	}

	func setupImageViewCompactLayout() {
		compactConstraints.append(contentsOf: [
			imageView.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.imageMargin.rawValue),
		])
	}

	func setupTitleLabelCompactLayout() {
		compactConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.labelSpace.rawValue),
			titleLabel.topAnchor.constraint(
				equalTo: imageView.bottomAnchor,
				constant: Constants.labelSpace.rawValue)
		])
	}

	func setupTextLabelCompactLayout() {
		compactConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(
				equalTo: titleLabel.bottomAnchor,
				constant: Constants.labelSpace.rawValue)
		])
	}
}

// MARK: Regular Layout

private extension View2 {
	func setupRegularLayout() {
		setupImageViewRegularLayout()
		setupTitleLabelRegularLayout()
		setupTextLabelRegularLayout()
	}

	func setupImageViewRegularLayout() {
		regularConstraints.append(contentsOf: [
			imageView.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor,
				constant: Constants.imageMargin.rawValue),
			imageView.trailingAnchor.constraint(
				equalTo: textLabel.leadingAnchor,
				constant: -Constants.imageMargin.rawValue),
			imageView.widthAnchor.constraint(
				equalToConstant: Constants.imageViewHeight.rawValue)
		])
	}

	func setupTitleLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(
				equalTo: imageView.trailingAnchor,
				constant: Constants.labelSpace.rawValue),
			titleLabel.centerYAnchor.constraint(
				equalTo: imageView.centerYAnchor)
		])
	}

	func setupTextLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(
				equalTo: imageView.bottomAnchor,
				constant: Constants.labelSpace.rawValue)
		])
	}
}
