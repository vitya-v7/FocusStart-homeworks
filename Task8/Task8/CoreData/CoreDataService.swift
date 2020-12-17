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

		let personEntity = NSManagedObject(entity: entityDescription, insertInto: managedContext) as! Person

		personEntity.name = name
		personEntity.age = NSNumber.init(value: age)
		personEntity.position = position
		personEntity.toCompany = company

		if experience != nil {
		personEntity.experience = NSNumber.init(value: experience!)
		}
		else {
			personEntity.experience = nil
		}

		if education != nil {
		personEntity.education = education!
		}
		else {
			personEntity.education = nil
		}

		do {
			try managedContext.save()
		} catch let error {
			print(error.localizedDescription)
		}
	}

}
