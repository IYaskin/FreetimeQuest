//
//  MemoryObject+CoreDataProperties.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 20.03.2021.
//
//

import Foundation
import CoreData


extension MemoryObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoryObject> {
        return NSFetchRequest<MemoryObject>(entityName: "MemoryObject")
    }

    @NSManaged public var title: String
    @NSManaged public var date: Date
    @NSManaged public var image: Data?

}
