//
//  QuestObject+CoreDataProperties.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 17.02.2021.
//
//

import Foundation
import CoreData


extension QuestObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestObject> {
        return NSFetchRequest<QuestObject>(entityName: "QuestObject")
    }

    @NSManaged public var title: String
    @NSManaged public var id: Int16
    @NSManaged public var category: Int16
    @NSManaged public var stars: Int16
    
    @NSManaged public var image: Data
    @NSManaged public var isDone: Bool
}
