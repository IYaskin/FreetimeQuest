//
//  BrainQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class BrainQuests {

    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Сыграть в шахматы",
                                         id: 1,
                                         category: Category.brain.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Нарисовать картину",
                                         id: 2,
                                         category: Category.brain.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Прочитать книгу",
                                         id: 3,
                                         category: Category.brain.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Выучить стихотворение",
                                         id: 4,
                                         category: Category.brain.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Написать стихотворение",
                                         id: 5,
                                         category: Category.brain.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Сварить квас",
                                         id: 6,
                                         category: Category.brain.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Испечь пирог",
                                         id: 7,
                                         category: Category.brain.rawValue,
                                         stars: 1)

        CoreDataManager.shared.saveQuest(title: "Провести день без гаджетов",
                                         id: 8,
                                         category: Category.brain.rawValue,
                                         stars: 2)
        
//        CoreDataManager.shared.saveQuest(title: "Баскетбол",
//                                         id: 9,
//                                         category: Category.brain.rawValue)
//        
//        CoreDataManager.shared.saveQuest(title: "Хоккей",
//                                         id: 10,
//                                         category: Category.brain.rawValue)
        
    }
    
}
