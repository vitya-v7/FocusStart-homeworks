//
//  PersonDetailsViewController.swift
//  Task8
//
//  Created by Admin on 18.12.2020.
//


import UIKit

final class PersonDetailsViewController: UIViewController {
	
	// MARK: - Properties
	
	var person: Person?
	var company: Company?
	let personDetails = PersonDetailsView()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.systemBackground
		self.setupNavigationBar()
		self.setupPerson()
	}
	
	override func loadView() {
		self.view = personDetails
	}
	
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.navigationBar.barTintColor = UIColor.brown
	}
	
}

private extension PersonDetailsViewController {
	func setupNavigationBar() {
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
																 style: .plain,
																 target: self,
																 action: #selector(savePerson))
	}
	
	func setupPerson() {
		if let person = person {
			personDetails.nameTextField.text = person.name
			personDetails.ageTextField.text = person.age.stringValue
			personDetails.experienceTextField.text = person.experience?.stringValue
			personDetails.educationTextField.text = person.education
			personDetails.positionTextField.text = person.position
		}
	}
	
	@objc func savePerson() {
		if personDetails.nameTextField.text == "" ||
			personDetails.ageTextField.text == "" ||
			personDetails.positionTextField.text == ""
		{
			self.showAlert(title: "Error", message: "Enter name, age, education")
		}
		else {
			guard let company = company else { return }
			guard let age = self.personDetails.ageTextField.text, let nonOptAge = Int(age) else {
				self.showAlert(title: "Error", message: "Enter valid age")
				return
			}
			
			let experienceString: String? = self.personDetails.experienceTextField.text
			var experienceIn: Int? = nil
			if experienceString != nil, Int(experienceString!) != nil {
				experienceIn = Int(experienceString!)
			}
			else {
				self.personDetails.experienceTextField.text = ""
			}
			
			let educationIn: String?

			if self.personDetails.educationTextField.text == nil ||
				self.personDetails.educationTextField.text == "" {
				educationIn = nil
			}
			else {
				educationIn = self.personDetails.educationTextField.text
			}
			
			if person == nil {
				CoreDataService.shared.addPerson(age: nonOptAge,
												 name: self.personDetails.nameTextField.text ?? "",
												 position: self.personDetails.positionTextField.text ?? "",
												 experience: experienceIn,
												 education: educationIn,
												 company: company)
			}
			else {
				guard let person = person else { return }
				CoreDataService.shared.savePerson(person: person,
												  age: nonOptAge,
												  name: self.personDetails.nameTextField.text ?? "",
												  position: self.personDetails.positionTextField.text ?? "",
												  experience: experienceIn,
												  education: educationIn)
			}
			self.navigationController?.popViewController(animated: true)
		}
	}
}

// MARK: - Alert

extension PersonDetailsViewController {
	private func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let ok = UIAlertAction(title: "Ok", style: .default)
		
		alert.addAction(ok)
		
		present(alert, animated: true)
	}
}




