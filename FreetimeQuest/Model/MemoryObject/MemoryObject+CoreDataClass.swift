//
//  MemoryObject+CoreDataClass.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 20.03.2021.
//
//

import Foundation
import CoreData

@objc(MemoryObject)
public class MemoryObject: NSManagedObject {
    convenience init() {
        // Описание сущности
        let entity = NSEntityDescription.entity(forEntityName: "MemoryObject",
                                                in: CoreDataManager.shared.viewContext)
   
        // Создание нового объекта
        self.init(entity: entity!,
                  insertInto: CoreDataManager.shared.viewContext)
    }

}
