//
//  CoreDataService.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit
import CoreData


class CoreDataService {

	static let shared = CoreDataService()
	private var managedContext: NSManagedObjectContext
	private var persistentContainer: NSPersistentContainer

	private init() {
		persistentContainer = NSPersistentContainer(name: "Task8Model")
		persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		managedContext = persistentContainer.viewContext
	}

	func addCompany(_ name: String) -> Company? {
		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Company", in: managedContext)
		else { return nil }
		let company = NSManagedObject(entity: entityDescription, insertInto: managedContext) as! Company

		company.companyName = name

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

		savePersonToCompany(company: company, person: person, age: age, name: name, position: position, experience: experience, education: education)
		
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
		fetchRequest.predicate = NSPredicate(format: "company == %@", company)

		do {
			persons = try managedContext.fetch(fetchRequest)
		} catch let error {
			print(error.localizedDescription)
		}

		return persons
	}

	func savePersonToCompany(company: Company,
							 person: Person,
							 age: Int,
							 name: String,
							 position: String,
							 experience: Int?,
							 education: String?) {

		person.name = name
		person.age = NSNumber(value: age)
		person.position = position
		person.company = company

		if experience != nil {
			person.experience = NSNumber(value: experience!)
		}
		else {
			person.experience = 0
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
