//
//  HobbyQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import Foundation

class HobbyQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Сыграть партию в шахматы",
                                         id: 1,
                                         category: Category.adventure.rawValue,
                                         stars: 1)
    }
}
