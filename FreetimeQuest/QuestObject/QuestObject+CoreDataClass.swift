//
//  QuestObject+CoreDataClass.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 17.02.2021.
//
//

import Foundation
import CoreData

@objc(QuestObject)
public class QuestObject: NSManagedObject {
    
    convenience init() {
        // Описание сущности
        let entity = NSEntityDescription.entityForName("QuestObject",
                                                       inManagedObjectContext: CoreDataManager.shared.managedObjectContext)
   
        // Создание нового объекта
        self.init(entity: entity!,
                  insertIntoManagedObjectContext: CoreDataManager.shared.managedObjectContext)
    }

}
