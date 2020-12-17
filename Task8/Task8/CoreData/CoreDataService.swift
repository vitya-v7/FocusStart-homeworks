//
//  CoreDataService.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit
import CoreData


struct CoreDataService {

	static let shared = CoreDataManager()

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
}
