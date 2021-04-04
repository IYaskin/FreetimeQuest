//
//  GoOutQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class GoOutQuests {
    
        
    static func addQuests() {
        let star = 1
        let category = Category.goOut.rawValue
        
        CoreDataManager.shared.saveQuest(title: "Музей",
                                         id: 1,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Театр",
                                         id: 2,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Галерея",
                                         id: 3,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Зоопарк",
                                         id: 4,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Футбол",
                                         id: 5,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Баскетбол",
                                         id: 6,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Хоккей",
                                         id: 7,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Боулинг",
                                         id: 8,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Бильярд",
                                         id: 9,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Концерт",
                                         id: 10,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Квест",
                                         id: 11,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Каток",
                                         id: 12,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Картинг",
                                         id: 13,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Батуты",
                                         id: 14,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Аквапарк",
                                         id: 15,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Экскурсия",
                                         id: 16,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Дегустация",
                                         id: 17,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Бар",
                                         id: 18,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Ночной клуб",
                                         id: 19,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Stand Up",
                                         id: 20,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Баня",
                                         id: 21,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Фестиваль",
                                         id: 22,
                                         category: category,
                                         stars: star)

    }
    
}
