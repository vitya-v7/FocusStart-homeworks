//
//  Company+CoreDataProperties.swift
//  
//
//  Created by Admin on 17.12.2020.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var name: String?
    @NSManaged public var toPerson: NSSet?

}

// MARK: Generated accessors for toPerson
extension Company {

    @objc(addToPersonObject:)
    @NSManaged public func addToToPerson(_ value: Person)

    @objc(removeToPersonObject:)
    @NSManaged public func removeFromToPerson(_ value: Person)

    @objc(addToPerson:)
    @NSManaged public func addToToPerson(_ values: NSSet)

    @objc(removeToPerson:)
    @NSManaged public func removeFromToPerson(_ values: NSSet)

}
