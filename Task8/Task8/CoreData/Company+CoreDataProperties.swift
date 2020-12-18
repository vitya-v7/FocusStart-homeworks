//
//  Company+CoreDataProperties.swift
//  
//
//  Created by Admin on 18.12.2020.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var companyName: String?
    @NSManaged public var person: NSSet?

}

// MARK: Generated accessors for person
extension Company {

    @objc(addPersonObject:)
    @NSManaged public func addToPerson(_ value: Person)

    @objc(removePersonObject:)
    @NSManaged public func removeFromPerson(_ value: Person)

    @objc(addPerson:)
    @NSManaged public func addToPerson(_ values: NSSet)

    @objc(removePerson:)
    @NSManaged public func removeFromPerson(_ values: NSSet)

}
