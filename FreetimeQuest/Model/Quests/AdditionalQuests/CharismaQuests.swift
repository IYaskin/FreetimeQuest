//
//  Charisma.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import Foundation

class CharismaQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Упражнения на развитие речи",
                                         id: 1,
                                         category: Category.charisma.rawValue,
                                         stars: 1)
    }
}
