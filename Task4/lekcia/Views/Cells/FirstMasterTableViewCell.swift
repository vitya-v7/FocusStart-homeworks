//
//  MasterTableViewCell.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class FirstMasterTableViewCell: MainCell {
 
	static var reuseIdentifier: String {
		return String(describing: FirstMasterTableViewCell.self)
	}
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		self.setupViewsAppearances()
		self.setupViewsLayout()
	}
	
}


private extension FirstMasterTableViewCell {
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
		titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
	}

	func setupDescriptionLabelAppearances() {
		titleLabel.numberOfLines = 1
		descriptionLabel.numberOfLines = 1
		descriptionLabel.textAlignment = .center
	}

	func setupDateAppearances() {
		date.numberOfLines = 1
		date.textAlignment = .center
		date.font = UIFont.italicSystemFont(ofSize: 12)

	}
}

// MARK: Shared Layout

private extension FirstMasterTableViewCell {

	func setupViewsLayout() {
		setupSharedLayout()
	}

	func setupSharedLayout() {
		NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.leadingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 titleLabel.topAnchor.constraint(
										equalTo: safeAreaLayoutGuide.topAnchor),
									 titleLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 1)])
		NSLayoutConstraint.activate([descriptionLabel.leadingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.leadingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 descriptionLabel.bottomAnchor.constraint(
										equalTo: safeAreaLayoutGuide.bottomAnchor),
									 descriptionLabel.topAnchor.constraint(
										greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 5),
									 descriptionLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)])
		NSLayoutConstraint.activate([date.trailingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.trailingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 date.bottomAnchor.constraint(
										equalTo: descriptionLabel.bottomAnchor),
									 date.widthAnchor.constraint(
										equalTo: self.safeAreaLayoutGuide.widthAnchor,
										multiplier: 0.3),
									 date.heightAnchor.constraint(
									 equalTo: descriptionLabel.heightAnchor,
									 multiplier: 1)])
	}
}


