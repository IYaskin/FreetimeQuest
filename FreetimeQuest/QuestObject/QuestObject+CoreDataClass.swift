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

//    static func quests() -> [QuestObject] {
//        var quests = [QuestStruct]()
//        quests.append(museum)
//        quests.append(craftBeer)
//        quests.append(smile)
//        quests.append(helpCarryBag)
//        quests.append(tatoo)
//
//        return quests
//    }
//    
//    static let museum: QuestObject = QuestObject(title: "Посетить музей",
//                                          id: 1,
//                                          type: .goOut)
//    
//    static let craftBeer: QuestObject = QuestStruct(title: "Приготовить домашний квас",
//                                          id: 2,
//                                          type: .brain)
//    
//    static let smile: QuestObject = QuestStruct(title: "Улыбнуться прохожему",
//                                          id: 3,
//                                          type: .social)
//    
//    static let helpCarryBag: QuestObject = QuestStruct(title: "Помочь донести пакет",
//                                          id: 4,
//                                          type: .good)
//    
//    static let tatoo: QuestStruct = QuestStruct(title: "Сделать татуировку",
//                                          id: 5,
//                                          type: .adventure)

}
