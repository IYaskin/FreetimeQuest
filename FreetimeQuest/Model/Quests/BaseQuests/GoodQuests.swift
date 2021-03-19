//
//  GoodQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class GoodQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Помочь донести пакет",
                                         id: 1,
                                         category: Category.good.rawValue,
                                         stars: 2)
        
        CoreDataManager.shared.saveQuest(title: "Покормить уточек",
                                         id: 2,
                                         category: Category.good.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Отдать старые вещи нуждающимся",
                                         id: 3,
                                         category: Category.good.rawValue,
                                         stars: 3)
        
        CoreDataManager.shared.saveQuest(title: "Перечислить любую сумму в фонд помощи",
                                         id: 4,
                                         category: Category.good.rawValue,
                                         stars: 2)
        
        CoreDataManager.shared.saveQuest(title: "Купить подарок близкому человеку",
                                         id: 5,
                                         category: Category.good.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Поставить оценку этому приложению",
                                         id: 6,
                                         category: Category.good.rawValue,
                                         stars: 1)
        
//        CoreDataManager.shared.saveQuest(title: "Испечь пирог",
//                                         id: 7,
//                                         category: Category.good.rawValue)
//
//        CoreDataManager.shared.saveQuest(title: "Провести день без гаджетов",
//                                         id: 8,
//                                         category: Category.good.rawValue)
        
//        CoreDataManager.shared.saveQuest(title: "Баскетбол",
//                                         id: 9,
//                                         category: Category.good.rawValue)
//
//        CoreDataManager.shared.saveQuest(title: "Хоккей",
//                                         id: 10,
//                                         category: Category.good.rawValue)
        
    }
    
}
