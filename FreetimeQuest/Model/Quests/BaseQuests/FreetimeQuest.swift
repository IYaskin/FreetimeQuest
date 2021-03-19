//
//  FreetimeQuest.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 12.03.2021.
//

import Foundation

class FreetimeQuest {
    
    static func addHeader() {
        CoreDataManager.shared.saveQuest(title: "Freetime Quest",
                                         id: 1,
                                         category: Category.freetimeQuest.rawValue,
                                         stars: 0)
    }
}
