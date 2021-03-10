//
//  GoOutQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class GoOutQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Музей",
                                         id: 1,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Театр",
                                         id: 2,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Галерея",
                                         id: 3,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Зоопарк",
                                         id: 4,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Аквапарк",
                                         id: 5,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Ночной Клуб",
                                         id: 6,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Stand Up",
                                         id: 7,
                                         category: Category.goOut.rawValue)

        CoreDataManager.shared.saveQuest(title: "Футбол",
                                         id: 8,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Баскетбол",
                                         id: 9,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Хоккей",
                                         id: 10,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Боулинг",
                                         id: 11,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Бильярд",
                                         id: 12,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Квест",
                                         id: 13,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Каток",
                                         id: 14,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Экскурсия",
                                         id: 15,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Дегустация",
                                         id: 16,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Картинг",
                                         id: 17,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Батуты",
                                         id: 18,
                                         category: Category.goOut.rawValue)

        CoreDataManager.shared.saveQuest(title: "Концерт",
                                         id: 19,
                                         category: Category.goOut.rawValue)

        CoreDataManager.shared.saveQuest(title: "Бар",
                                         id: 20,
                                         category: Category.goOut.rawValue)

    }
    
}
