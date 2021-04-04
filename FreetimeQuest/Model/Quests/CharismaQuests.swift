//
//  Charisma.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import Foundation

class CharismaQuests {
    
    static func addQuests() {
        
        let category = Category.charisma.rawValue

        let twoStar = 2

        CoreDataManager.shared.saveQuest(title: "Вылечить зубы",
                                         id: 1,
                                         category: category,
                                         stars: twoStar)
        
        CoreDataManager.shared.saveQuest(title: "Сходить на 8 сеансов массажа",
                                         id: 2,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Заниматься йогой в течении месяца",
                                         id: 3,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Медитировать в течении месяца",
                                         id: 4,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Развивать речь в течении месяца",
                                         id: 5,
                                         category: category,
                                         stars: twoStar)
        
        CoreDataManager.shared.saveQuest(title: "Развивать осанку в течении месяца",
                                         id: 6,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Закаляться в течении месяца",
                                         id: 7,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Делать зарядку в течении месяца",
                                         id: 8,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Правильно питаться в течении месяца",
                                         id: 9,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Прочитать 5 книг по развитию или по работе",
                                         id: 10,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Повысить свой доход",
                                         id: 11,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Устроить себе фотосессию",
                                         id: 12,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Сходить на сеанс к психологу",
                                         id: 13,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Купить себе то, что давно хочешь",
                                         id: 14,
                                         category: category,
                                         stars: twoStar)

        let threeStar = 3

        CoreDataManager.shared.saveQuest(title: "Достичь своего идеального веса",
                                         id: 15,
                                         category: category,
                                         stars: threeStar)

        CoreDataManager.shared.saveQuest(title: "Пробежать полумарафон",
                                         id: 16,
                                         category: category,
                                         stars: threeStar)

        CoreDataManager.shared.saveQuest(title: "Избавиться от вредной привычки",
                                         id: 17,
                                         category: category,
                                         stars: threeStar)

    }
}
