//
//  LiberationQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import Foundation

class LiberationQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Искупаться в фонтане",
                                         id: 1,
                                         category: Category.liberation.rawValue,
                                         stars: 1)
    }
}

