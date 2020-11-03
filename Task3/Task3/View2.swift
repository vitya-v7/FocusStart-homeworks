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
            case horizontalStandardSpace = 16
            case horizontalBigSpace = 32
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
            self.backgroundColor = .systemBackground
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
                Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                    Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                    Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                    Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                """
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
            self.addSubview(scrollView)
            scrollView.translatesAutoresizingMaskIntoConstraints = false

            sharedConstraints.append(contentsOf: [
                scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
                scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor)
            ])
        }

        func setupImageViewLayout() {
            scrollView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false

            sharedConstraints.append(contentsOf: [
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
                imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
                imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight.rawValue)
            ])
        }

        func setupTitleLabelLayout() {
            scrollView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            sharedConstraints.append(contentsOf: [
                titleLabel.trailingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.horizontalStandardSpace.rawValue)
            ])
        }
        
        func setupTextLabelLayout() {
            scrollView.addSubview(textLabel)
            textLabel.translatesAutoresizingMaskIntoConstraints = false

            sharedConstraints.append(contentsOf: [
                textLabel.trailingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.horizontalStandardSpace.rawValue),
                textLabel.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
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
                imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            ])
        }
        
        func setupTitleLabelCompactLayout() {
            compactConstraints.append(contentsOf: [
                titleLabel.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15)
            ])
        }
        
        func setupTextLabelCompactLayout() {
            compactConstraints.append(contentsOf: [
                textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15)
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
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                imageView.trailingAnchor.constraint(equalTo: textLabel.leadingAnchor, constant: -Constants.horizontalBigSpace.rawValue),
                imageView.widthAnchor.constraint(equalToConstant: 300)
            ])
        }

        func setupTitleLabelRegularLayout() {
            regularConstraints.append(contentsOf: [
                titleLabel.leadingAnchor.constraint(
                    equalTo: self.imageView.trailingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
            ])
        }
        
        func setupTextLabelRegularLayout() {
            regularConstraints.append(contentsOf: [
                textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15)
            ])
        }
}
