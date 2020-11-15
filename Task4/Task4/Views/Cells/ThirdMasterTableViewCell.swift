//
//  MasterTableViewCell.swift
//  Task4
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class ThirdMasterTableViewCell: MainCell {

	static var reuseIdentifier: String {
		return String(describing: ThirdMasterTableViewCell.self)
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		self.setupViewsAppearances()
		self.setupViewsLayout()
	}
}

//MARK: - Appearances

private extension ThirdMasterTableViewCell {
	func setupViewsAppearances() {
		setupSuperViewAppearances()
		setupTitleLabelAppearances()
		setupDescriptionLabelAppearances()
		setupDateAppearances()
	}

	func setupSuperViewAppearances() {
		backgroundColor = .systemBackground
	}

	func setupTitleLabelAppearances() {
		titleLabel.numberOfLines = 1
		titleLabel.textAlignment = .left
		titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
	}

	func setupDescriptionLabelAppearances() {
		descriptionLabel.numberOfLines = 1
		descriptionLabel.numberOfLines = 1
		descriptionLabel.textAlignment = .left
		descriptionLabel.font = UIFont.italicSystemFont(ofSize: 20)
	}

	func setupDateAppearances() {
		date.numberOfLines = 1
		date.textAlignment = .left
		date.font = UIFont.italicSystemFont(ofSize: 12)

	}
}

// MARK: - Shared Layout

private extension ThirdMasterTableViewCell {

	func setupViewsLayout() {
		setupSharedLayout()
	}

	func setupSharedLayout() {
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(descriptionLabel)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		
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
									 descriptionLabel.trailingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.trailingAnchor,
										constant: -CGFloat(Constants.leftAndRight.rawValue)),
									 descriptionLabel.bottomAnchor.constraint(
										equalTo: safeAreaLayoutGuide.bottomAnchor),
									 descriptionLabel.topAnchor.constraint(
										greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 5)])
		}
}


