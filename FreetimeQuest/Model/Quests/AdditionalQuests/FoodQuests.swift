//
//  FoodQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import Foundation

class FoodQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Попробовать итальянскую кухню",
                                         id: 1,
                                         category: Category.food.rawValue,
                                         stars: 1)
    }
}
