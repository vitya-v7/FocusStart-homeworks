//
//  CoreDataService.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit
import CoreData


struct CoreDataService {

	static let shared = CoreDataService()

	private let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	func addCompany(_ name: String) -> Company? {
		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Company", in: managedContext)
		else { return nil }
		let company = NSManagedObject(entity: entityDescription, insertInto: managedContext) as! Company

		company.name = name

		do {
			try managedContext.save()
			return company
		} catch let error {
			print(error.localizedDescription)
			return nil
		}
	}

	func addPerson(age: Int,
				   name: String,
				   position: String,
				   experience: Int?,
				   education: String?,
				   company: Company) {

		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
		else { return }

		let person = NSManagedObject(entity: entityDescription, insertInto: managedContext) as! Person

		savePerson(person: person, age: age, name: name, position: position, experience: experience, education: education, company: company)
		
	}

	func fetchCompanies() -> [Company] {
		var companies = [Company]()

		let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()

		do {
			companies = try managedContext.fetch(fetchRequest)
		} catch let error {
			print(error.localizedDescription)
		}

		return companies
	}


	func fetchPersonsFromCompany(company: Company) -> [Person] {
		var persons = [Person]()

		let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
		fetchRequest.predicate = NSPredicate(format: "toCompany == %@", company)

		do {
			persons = try managedContext.fetch(fetchRequest)
		} catch let error {
			print(error.localizedDescription)
		}

		return persons
	}


	func savePerson(person: Person,
					age: Int,
					name: String,
					position: String,
					experience: Int?,
					education: String?,
					company: Company) {

		person.name = name
		person.age = NSNumber.init(value: age)
		person.position = position
		person.toCompany = company

		if experience != nil {
			person.experience = NSNumber.init(value: experience!)
		}
		else {
			person.experience = nil
		}

		if education != nil {
			person.education = education!
		}
		else {
			person.education = nil
		}

		do {
			try managedContext.save()
		} catch let error {
			print(error.localizedDescription)
		}
	}
}
