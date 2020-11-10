//
//  DetailView.swift
//  lekcia
//
//  Created by Admin on 10.11.2020.
//

import UIKit

//
//  DetailView.swift
//  Homework4
//
//  Created by Михаил Жданов on 07.11.2020.
//  Copyright © 2020 Михаил Жданов. All rights reserved.
//

import UIKit

class DetailView: UIView {

	// MARK: - Properties

	private let descriptionFontSize: CGFloat = 14
	private let imagesCornerRadius: CGFloat = 12
	private let imagesShadowSettings = ShadowSettings(radius: 8, opacity: 0.5)

	// MARK: - Views

	var scrollView = UIScrollView()
	var scrollableView = UIView()
	var descriptionLabel = UILabel()
	var firstImage = RoundShadowImageView()
	var secondImage = RoundShadowImageView()
}
	private extension DetailView {
		func setupViewsAppearances() {
			setupSuperViewAppearances()
			setupScrollViewLabelAppearances()
			setupScrollableContentAppearances()
			setupDescriptionAppearances()
		}
		func setupSuperViewAppearances() {
			backgroundColor = .systemBackground
		}

		func setupScrollViewLabelAppearances() {
			scrollView.contentInsetAdjustmentBehavior = .always
		}

		func setupScrollableContentAppearances() {
			scrollableView.backgroundColor = .clear
		}

		func setupDescriptionAppearances() {
			descriptionLabel.numberOfLines = 0
			descriptionLabel.textAlignment = .center
			descriptionLabel.font = UIFont.systemFont(ofSize: 20)
		}

		func setupTitleLabelAppearances() {
			titleLabel.numberOfLines = 1
			titleLabel.textAlignment = .left
			titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
		}

	}

// MARK: Shared Layout

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
			addSubview(titleLabel)
			titleLabel.translatesAutoresizingMaskIntoConstraints = false
			addSubview(descriptionLabel)
			descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
			addSubview(date)
			date.translatesAutoresizingMaskIntoConstraints = false

			NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(
											equalTo: safeAreaLayoutGuide.leadingAnchor,
											constant: CGFloat(Constants.leftAndRight.rawValue)),
										 titleLabel.topAnchor.constraint(
											equalTo: safeAreaLayoutGuide.topAnchor,
											constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
										 titleLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 1)])
			NSLayoutConstraint.activate([descriptionLabel.leadingAnchor.constraint(
											equalTo: safeAreaLayoutGuide.leadingAnchor,
											constant: CGFloat(Constants.leftAndRight.rawValue)),
										 descriptionLabel.bottomAnchor.constraint(
											equalTo: safeAreaLayoutGuide.bottomAnchor),
										 descriptionLabel.topAnchor.constraint(
											greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 5),
										 descriptionLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5)])
			NSLayoutConstraint.activate([date.trailingAnchor.constraint(
											equalTo: safeAreaLayoutGuide.trailingAnchor,
											constant: CGFloat(-Constants.leftAndRight.rawValue)),
										 date.bottomAnchor.constraint(
											equalTo: descriptionLabel.bottomAnchor),
										 date.widthAnchor.constraint(
											equalTo: self.safeAreaLayoutGuide.widthAnchor,
											multiplier: 0.2) ])
		}
	}



	}
private extension DetailView {

	// MARK: - Layout

	func layoutViews() {
		addSubviews()
		layoutScrollView()
		layoutScrollableContentView()
		layoutDescriptionLabel()
		layoutFirstImageView()
		layoutSecondImageView()
	}

	func addSubviews() {
		addSubview(scrollView)
		scrollView.addSubview(scrollableContentView)
		scrollableContentView.addSubview(descriptionLabel)
		scrollableContentView.addSubview(firstImageView)
		scrollableContentView.addSubview(secondImageView)
	}

	func layoutScrollView() {
		scrollView.pin(.leading, to: .leading, of: self)
		scrollView.pin(.trailing, to: .trailing, of: self)
		scrollView.pin(.top, to: .top, of: self)
		scrollView.pin(.bottom, to: .bottom, of: self)
	}

	func layoutScrollableContentView() {
		scrollableContentView.pin(.leading, to: .leading, of: scrollView)
		scrollableContentView.pin(.trailing, to: .trailing, of: scrollView)
		scrollableContentView.pin(.top, to: .top, of: scrollView)
		scrollableContentView.pin(.bottom, to: .bottom, of: scrollView)
		scrollableContentView.pin(.width, to: .width, of: safeAreaLayoutGuide)
	}

	func layoutDescriptionLabel() {
		descriptionLabel.pin(.leading, to: .leading, of: scrollableContentView, constant: Spacings.standard)
		descriptionLabel.pin(.trailing, to: .trailing, of: scrollableContentView, constant: -Spacings.standard)
		descriptionLabel.pin(.top, to: .top, of: scrollableContentView, constant: Spacings.standard)
	}

	func layoutFirstImageView() {
		firstImageView.pin(.leading, to: .leading, of: scrollableContentView, constant: Spacings.large)
		firstImageView.pin(.trailing, to: .trailing, of: scrollableContentView, constant: -Spacings.large)
		firstImageView.pin(.top, to: .bottom, of: descriptionLabel, constant: Spacings.large)
		firstImageView.pin(.width, to: .height, of: firstImageView, multiplier: 16 / 9)
	}

	func layoutSecondImageView() {
		secondImageView.pin(.leading, to: .leading, of: scrollableContentView, constant: Spacings.large)
		secondImageView.pin(.trailing, to: .trailing, of: scrollableContentView, constant: -Spacings.large)
		secondImageView.pin(.top, to: .bottom, of: firstImageView, constant: Spacings.large)
		secondImageView.pin(.bottom, to: .bottom, of: scrollView, constant: -Spacings.large)
		secondImageView.pin(.width, to: .height, of: secondImageView, multiplier: 16 / 9)
	}

}
