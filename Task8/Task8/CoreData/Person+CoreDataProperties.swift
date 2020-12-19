//
//  Person+CoreDataProperties.swift
//  Task8
//
//  Created by Admin on 19.12.2020.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: NSNumber
    @NSManaged public var education: String?
    @NSManaged public var experience: NSNumber?
    @NSManaged public var name: String
    @NSManaged public var position: String
    @NSManaged public var company: Company?

}

extension Person : Identifiable {

}
