//
//  AdventureQuest.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class AdventureQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Встретить рассвет",
                                         id: 1,
                                         category: Category.adventure.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Покататься на лошади",
                                         id: 2,
                                         category: Category.adventure.rawValue,
                                         stars: 2)
        
        CoreDataManager.shared.saveQuest(title: "Прыгнуть с веревкой",
                                         id: 3,
                                         category: Category.adventure.rawValue,
                                         stars: 3)
        
        CoreDataManager.shared.saveQuest(title: "Прыгнуть с парашютом",
                                         id: 4,
                                         category: Category.adventure.rawValue,
                                         stars: 3)
        
        CoreDataManager.shared.saveQuest(title: "Сделать тату",
                                         id: 5,
                                         category: Category.adventure.rawValue,
                                         stars: 3)
        
        CoreDataManager.shared.saveQuest(title: "Сделать ставку на матч",
                                         id: 6,
                                         category: Category.adventure.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Покататься на серфинге",
                                         id: 7,
                                         category: Category.adventure.rawValue,
                                         stars: 3)

        CoreDataManager.shared.saveQuest(title: "Полетать на кукурузнике",
                                         id: 8,
                                         category: Category.adventure.rawValue,
                                         stars: 3)
        
        CoreDataManager.shared.saveQuest(title: "Поплавать с аквалангом",
                                         id: 9,
                                         category: Category.adventure.rawValue,
                                         stars: 3)

        CoreDataManager.shared.saveQuest(title: "Увидеть северное сияние",
                                         id: 10,
                                         category: Category.adventure.rawValue,
                                         stars: 3)
        
    }
    
}
