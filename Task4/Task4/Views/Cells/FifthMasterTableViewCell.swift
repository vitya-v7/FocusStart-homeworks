//
//  MasterTableViewCell.swift
//  Task4
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class FifthMasterTableViewCell: MainCell {

	static var reuseIdentifier: String {
		return String(describing: FifthMasterTableViewCell.self)
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		self.setupViewsAppearances()
		self.setupViewsLayout()
	}

}

//MARK: - Appearances

private extension FifthMasterTableViewCell {
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
		titleLabel.font = UIFont.boldSystemFont(ofSize: ConstantsForFontSize.titleInDetailLabelFontSize)
	}

	func setupDescriptionLabelAppearances() {
		descriptionLabel.numberOfLines = 1
		descriptionLabel.textAlignment = .left
		descriptionLabel.font = UIFont.italicSystemFont(ofSize: ConstantsForFontSize.descriptionLabelFontSize)
	}

	func setupDateAppearances() {
		date.numberOfLines = 1
		date.textAlignment = .left
		date.font = UIFont.italicSystemFont(ofSize: ConstantsForFontSize.dateFontInCellSize)

	}
}

// MARK: - Shared Layout

private extension FifthMasterTableViewCell {

	func setupViewsLayout() {
		setupSharedLayout()
	}

	func setupSharedLayout() {
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.leadingAnchor,
										constant: ConstantsForSpace.leftAndRight),
									 titleLabel.topAnchor.constraint(
										equalTo: safeAreaLayoutGuide.topAnchor,
										constant: ConstantsForSpace.bottomAndTopSpace),
									 titleLabel.trailingAnchor.constraint(
										equalTo: self.safeAreaLayoutGuide.trailingAnchor,
										constant: -ConstantsForSpace.leftAndRight),
									 titleLabel.bottomAnchor.constraint(
										equalTo: self.safeAreaLayoutGuide.bottomAnchor,
										constant:
										-ConstantsForSpace.bottomAndTopSpace)])
	}
}


