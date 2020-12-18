//
//  PersonCell.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit

class PersonCell: UITableViewCell {
	static let cellIdentifier = "PersonCell"
	var labelName = UILabel()
	func configureCell(model: Person) {
		labelName.text = model.name
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.setupElements()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Adding constraints to image

private extension PersonCell {

	func setupElements() {
		setupLabelNameAppearances()
		setupLabelNameLayout()
	}

	func setupLabelNameAppearances() {
		self.labelName.numberOfLines = 1
		self.labelName.textAlignment = .center
		self.labelName.font = UIFont.boldSystemFont(ofSize: Constants.labelFontSize)
		//self.labelName.text = "Different font"
	}

	func setupLabelNameLayout() {
		self.contentView.addSubview(self.labelName)
		self.labelName.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			self.labelName.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			self.labelName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			self.labelName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
		])
	}
}
