//
//  SocialQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class SocialQuests {
    
    static func addQuests() {
        
        CoreDataManager.shared.saveQuest(title: "Улыбнуться прохожему",
                                         id: 1,
                                         category: Category.social.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Подмигнуть прохожему",
                                         id: 2,
                                         category: Category.social.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Скорчить рожицу прохожему",
                                         id: 3,
                                         category: Category.social.rawValue,
                                         stars: 2)
        
        CoreDataManager.shared.saveQuest(title: "Спросить 10 вопросов у прохожих",
                                         id: 4,
                                         category: Category.social.rawValue,
                                         stars: 2)
        
        CoreDataManager.shared.saveQuest(title: "Позвонить в любую организацию. Продержаться на проводе 2 минуты.",
                                         id: 5,
                                         category: Category.social.rawValue,
                                         stars: 1)
        
        CoreDataManager.shared.saveQuest(title: "Попросить вас сфотографировать",
                                         id: 6,
                                         category: Category.social.rawValue,
                                         stars: 2)
        
        CoreDataManager.shared.saveQuest(title: "Сделать селфи с прохожим",
                                         id: 7,
                                         category: Category.social.rawValue,
                                         stars: 3)

//        CoreDataManager.shared.saveQuest(title: "Провести день без гаджетов",
//                                         id: 8,
//                                         category: Category.brain.rawValue)
        
//        CoreDataManager.shared.saveQuest(title: "Баскетбол",
//                                         id: 9,
//                                         category: Category.brain.rawValue)
//
//        CoreDataManager.shared.saveQuest(title: "Хоккей",
//                                         id: 10,
//                                         category: Category.brain.rawValue)
        
    }
    
}
