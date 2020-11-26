//
//  DetailViewController.swift
//  Task4
//
//  Created by Admin on 07.11.2020.
//


import UIKit

// MARK: - Protocols

protocol IDetailViewInput: UIView {
	func configure(object: CellModel?)
}

class DetailView: UIView {

	// MARK: - Views

	var scrollView = UIScrollView()
	var scrollableView = UIView()
	var descriptionLabel = UILabel()
	var firstImage = RoundShadowImageView()
	var secondImage = RoundShadowImageView()

	// MARK: - Life сycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		setupViewsAppearances()
		setupViewsLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension DetailView: IDetailViewInput {
	func configure(object: CellModel?) {
		if let object = object {
			descriptionLabel.text = object.description
			firstImage.image = object.firstImage
			secondImage.image = object.secondImage
		}
	}
}
// MARK: - Appearances

private extension DetailView {
	func setupViewsAppearances() {
		setupSuperViewAppearances()
		setupScrollViewAppearances()
		setupScrollableContentAppearances()
		setupDescriptionAppearances()
		setupImage1Appearances()
		setupImage2Appearances()
	}
	func setupSuperViewAppearances() {
		backgroundColor = .systemBackground
	}

	func setupScrollViewAppearances() {
		scrollView.contentInsetAdjustmentBehavior = .always
	}

	func setupScrollableContentAppearances() {
		scrollableView.backgroundColor = .clear
	}

	func setupDescriptionAppearances() {
		descriptionLabel.numberOfLines = 0
		descriptionLabel.textAlignment = .center
		descriptionLabel.font = UIFont.systemFont(ofSize: ConstantsForFontSize.descriptionLabelFontSize)
	}
	func setupImage1Appearances() {
		firstImage.backgroundColor = UIColor.white
	}
	func setupImage2Appearances() {
		secondImage.backgroundColor = UIColor.white
	}
}

// MARK: - Shared Layout

private extension DetailView {

	func setupViewsLayout() {
		addSubviews()
		setupSharedLayout()
	}

	func addSubviews() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollableView.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		firstImage.translatesAutoresizingMaskIntoConstraints = false
		secondImage.translatesAutoresizingMaskIntoConstraints = false
		addSubview(scrollView)
		scrollView.addSubview(scrollableView)
		scrollableView.addSubview(descriptionLabel)
		scrollableView.addSubview(firstImage)
		scrollableView.addSubview(secondImage)
	}
	func setupSharedLayout() {
		setupScrollViewLabelLayout()
		setupScrollableContentLayout()
		setupDescriptionLayout()
		setupFirstImageLayout()
		setupSecondImageLayout()
	}

	func setupScrollViewLabelLayout() {
		NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.leadingAnchor),
									 scrollView.trailingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.trailingAnchor),
									 scrollView.topAnchor.constraint(
										equalTo: safeAreaLayoutGuide.topAnchor),
									 scrollView.bottomAnchor.constraint(
										equalTo: safeAreaLayoutGuide.bottomAnchor)])
	}



	func setupScrollableContentLayout() {
		NSLayoutConstraint.activate([scrollableView.leadingAnchor.constraint(
										equalTo: scrollView.leadingAnchor),
									 scrollableView.trailingAnchor.constraint(
										equalTo: scrollView.trailingAnchor),
									 scrollableView.topAnchor.constraint(
										equalTo: scrollView.topAnchor),
									 scrollableView.bottomAnchor.constraint(
										equalTo: scrollView.bottomAnchor),
									 scrollableView.widthAnchor.constraint(
										equalTo: safeAreaLayoutGuide.widthAnchor)])
	}

	func setupDescriptionLayout() {
		NSLayoutConstraint.activate([descriptionLabel.leadingAnchor.constraint(
										equalTo: scrollableView.leadingAnchor,
										constant: ConstantsForSpace.standardSpace),
									 descriptionLabel.trailingAnchor.constraint(
										equalTo: scrollableView.trailingAnchor,
										constant: -ConstantsForSpace.standardSpace),
									 descriptionLabel.topAnchor.constraint(
										equalTo: scrollableView.topAnchor,
										constant: ConstantsForSpace.standardSpace)])

	}

	func setupFirstImageLayout() {
		NSLayoutConstraint.activate([firstImage.topAnchor.constraint(
										equalTo: descriptionLabel.bottomAnchor,
										constant: ConstantsForSpace.largeSpace),
									 firstImage.widthAnchor.constraint(
										equalTo: safeAreaLayoutGuide.widthAnchor,
										multiplier: 0.9),
									 firstImage.heightAnchor.constraint(
										equalTo: firstImage.widthAnchor,
										multiplier: 9/16),
									 firstImage.centerXAnchor.constraint(
										equalTo: safeAreaLayoutGuide.centerXAnchor)])

	}

	func setupSecondImageLayout() {
		NSLayoutConstraint.activate([secondImage.topAnchor.constraint(
										equalTo: firstImage.bottomAnchor,
										constant: ConstantsForSpace.largeSpace),
									 secondImage.bottomAnchor.constraint(
										equalTo: scrollView.bottomAnchor,
										constant: -ConstantsForSpace.largeSpace),
									 secondImage.widthAnchor.constraint(
										equalTo: safeAreaLayoutGuide.widthAnchor,
										multiplier: 0.9),
									 secondImage.heightAnchor.constraint(
										equalTo: secondImage.widthAnchor,
										multiplier: 12/9),
									 secondImage.centerXAnchor.constraint(
										equalTo: safeAreaLayoutGuide.centerXAnchor)])
	}

}


