//
//  List+CoreDataProperties.swift
//  
//
//  Created by Admin on 16.12.2020.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
		
    }

    @NSManaged public var name: String

}
