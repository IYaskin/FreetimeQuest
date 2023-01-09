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
        let entity = NSEntityDescription.entity(forEntityName: "QuestObject",
                                                in: CoreDataManager.shared.viewContext)
   
        // Создание нового объекта
        self.init(entity: entity!,
                  insertInto: CoreDataManager.shared.viewContext)
    }
    
}
