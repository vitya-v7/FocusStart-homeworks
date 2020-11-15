//
//  MasterTableViewCell.swift
//  Task4
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class FourthMasterTableViewCell: MainCell {

	static var reuseIdentifier: String {
		return String(describing: FourthMasterTableViewCell.self)
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		self.setupViewsAppearances()
		self.setupViewsLayout()
	}
}

//MARK: - Appearances

private extension FourthMasterTableViewCell {
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
		descriptionLabel.numberOfLines = 2
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

private extension FourthMasterTableViewCell {

	func setupViewsLayout() {
		setupSharedLayout()
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
										multiplier: 0.2)])
	}
}


