//
//  ViewController+Quests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import Foundation

extension ViewController {
    
    func getQuests() -> [QuestObject] {
        return CoreDataManager.shared.getQuests()
    }
    
    func deleteQuests() {
        return CoreDataManager.shared.deleteQuests()
    }

    func addQuests() {
        CoreDataManager.shared.saveQuest(title: "Посетить музей",
                                         id: 1,
                                         category: Category.goOut.rawValue)
        CoreDataManager.shared.saveQuest(title: "Посетить театр",
                                         id: 2,
                                         category: Category.goOut.rawValue)
        CoreDataManager.shared.saveQuest(title: "Посетить оперу",
                                         id: 3,
                                         category: Category.goOut.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Посадить растение",
                                         id: 4,
                                         category: Category.brain.rawValue)
        
        CoreDataManager.shared.saveQuest(title: "Сделать татуировку",
                                         id: 5,
                                         category: Category.adventure.rawValue)
    }

}
