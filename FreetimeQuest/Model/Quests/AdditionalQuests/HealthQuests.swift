//
//  HealthQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import Foundation

class HealthQuests {
    
    // зрение, осанка
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Вылечить зубы",
                                         id: 1,
                                         category: Category.health.rawValue,
                                         stars: 1)
    }
}
