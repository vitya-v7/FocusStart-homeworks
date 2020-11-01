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

    private extension View1 {
        func setupViewsAppearances() {
            setupSuperViewAppearances()
            setupImageViewAppearances()
            setupTitleLabelAppearances()
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
            titleLabel.numberOfLines = 0
            titleLabel.text =
                """
                Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                    Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                    Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                    Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test
                """
        }
    }

    // MARK: Shared Layout

    private extension View1 {

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

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight.rawValue)
            ])
        }

        func setupTitleLabelLayout() {
            scrollView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                titleLabel.trailingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.horizontalStandardSpace.rawValue),
                titleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
        }
    }

    // MARK: Compact Layout

    private extension View1 {
        func setupCompactLayout() {
            setupImageViewCompactLayout()
            setupTitleLabelCompactLayout()
        }

        func setupImageViewCompactLayout() {
            compactConstraints.append(contentsOf: [
                imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            ])
        }

        func setupTitleLabelCompactLayout() {
            compactConstraints.append(contentsOf: [
                titleLabel.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32)
            ])
        }
    }

    // MARK: Regular Layout

    private extension View1 {
        func setupRegularLayout() {
            setupImageViewRegularLayout()
            setupTitleLabelRegularLayout()
        }

        func setupImageViewRegularLayout() {
            regularConstraints.append(contentsOf: [
                imageView.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -Constants.horizontalBigSpace.rawValue),
                imageView.widthAnchor.constraint(equalToConstant: 300)
            ])
        }

        func setupTitleLabelRegularLayout() {
            regularConstraints.append(contentsOf: [
                titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor)
            ])
        }

}
