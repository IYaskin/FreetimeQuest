//
//  TravelingQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import Foundation

class TravelingQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Пирамиды Хеопса",
                                         id: 1,
                                         category: Category.traveling.rawValue,
                                         stars: 1)
    }
}
