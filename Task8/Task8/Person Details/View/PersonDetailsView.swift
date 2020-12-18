//
//  PersonDetailView.swift
//  Task8
//
//  Created by Admin on 18.12.2020.
//

import UIKit

final class PersonDetailsView: UIView {
	
	// MARK: - Properties
	
	var nameTextField = UITextField()
	var ageTextField = UITextField()
	var experienceTextField = UITextField()
	var educationTextField = UITextField()
	var positionTextField = UITextField()
	var mainStackView = UIStackView()
	
	// MARK: - Lifecycle
	
	init() {
		super.init(frame: .zero)
		self.setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension PersonDetailsView {
	func setupView() {
		self.nameTextField.placeholder = "Name"

		self.ageTextField.placeholder = "Age"
		self.ageTextField.keyboardType = UIKeyboardType.numberPad
		
		self.experienceTextField.placeholder = "Number of years of work experience"
		self.experienceTextField.keyboardType = UIKeyboardType.numberPad
		
		self.educationTextField.placeholder = "Education"
		
		self.positionTextField.placeholder = "Position"
		
		self.mainStackView.axis = NSLayoutConstraint.Axis.vertical
		self.mainStackView.spacing = Constants.stackViewSpacing
		
		self.mainStackView.addArrangedSubview(nameTextField)
		self.mainStackView.addArrangedSubview(ageTextField)
		self.mainStackView.addArrangedSubview(experienceTextField)
		self.mainStackView.addArrangedSubview(educationTextField)
		self.mainStackView.addArrangedSubview(positionTextField)
		
		self.setupViewLayout()
	}
	
	func setupViewLayout() {
		self.addSubview(self.mainStackView)
		self.mainStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.mainStackView.topAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.topAnchor,
				constant: Constants.standartSizeSeparator),
			self.mainStackView.leadingAnchor.constraint(
				equalTo: self.leadingAnchor,
				constant: Constants.standartSizeSeparator),
			self.mainStackView.trailingAnchor.constraint(
				equalTo: self.trailingAnchor,
				constant: Constants.standartSizeSeparator)
		])
	}
}

