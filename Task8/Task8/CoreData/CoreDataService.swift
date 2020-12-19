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
	private var persistentContainer: NSPersistentContainer

	private init() {
		persistentContainer = NSPersistentContainer(name: "DataModelForTask8")
		persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
	}

	func addCompany(_ name: String) -> Company? {
		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Company", in: persistentContainer.viewContext)
		else { return nil }
		let company = NSManagedObject(entity: entityDescription, insertInto: persistentContainer.viewContext) as! Company

		company.companyName = name

		do {
			try persistentContainer.viewContext.save()
			return company
		} catch let error {
			print(error.localizedDescription)
			return nil
		}
	}

	func deleteCompany(_ company: Company) {
		persistentContainer.viewContext.delete(company)
		do {
			try persistentContainer.viewContext.save()

		} catch let error {
			print(error.localizedDescription)

		}
	}

	func fetchCompanies() -> [Company] {
		var companies = [Company]()
		let entityDescription = NSEntityDescription.entity(forEntityName: "Company", in: persistentContainer.viewContext)

		let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
		fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "companyName", ascending: true)]
		fetchRequest.entity = entityDescription
		do {
			companies = try persistentContainer.viewContext.fetch(fetchRequest)
		} catch let error {
			print(error.localizedDescription)
		}
		companies = companies.filter { $0.companyName != "" }
		return companies
	}

	func addPerson(age: Int,
				   name: String,
				   position: String,
				   experience: Int?,
				   education: String?,
				   company: Company) {

		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: persistentContainer.viewContext)
		else { fatalError() }

		let person = NSManagedObject(entity: entityDescription, insertInto: persistentContainer.viewContext) as! Person

		company.addToPerson(person)
		//person.company = company
		//вспомогательная функция
		savePerson(person: person, age: age, name: name, position: position, experience: experience, education: education)
	}

	func deletePerson(_ person: Person) {
		persistentContainer.viewContext.delete(person)
		do {
			try persistentContainer.viewContext.save()
		} catch let error {
			print(error.localizedDescription)
		}
	}

	func fetchPersonsFromCompany(company: Company) -> [Person] {
		var persons = [Person]()
		let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: persistentContainer.viewContext)

		let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
		fetchRequest.entity = entityDescription
		fetchRequest.predicate = NSPredicate(format: "company == %@", company)
		fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
		do {
			persons = try persistentContainer.viewContext.fetch(fetchRequest)
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
					education: String?) {

		person.name = name
		person.age = NSNumber(value: age)
		person.position = position

		if experience != nil {
			person.experience = NSNumber(value: experience!)
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
		person.companyName = ""
		do {
			try persistentContainer.viewContext.save()
		} catch let error {
			print(error.localizedDescription)
		}
	}
}
