//
//  AdventureQuest.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class AdventureQuests {
    
    static func addQuests() {
        
        let category = Category.adventure.rawValue

        let star = 1

        CoreDataManager.shared.saveQuest(title: "Встретить рассвет",
                                         id: 1,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сделать ставку на матч",
                                         id: 2,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Покататься по ночному городу",
                                         id: 3,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Посетить парк аттракционов",
                                         id: 4,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Покататься на сноуборде",
                                         id: 5,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Увидеть звездопад",
                                         id: 6,
                                         category: category,
                                         stars: star)

        let twoStar = 2

        
        CoreDataManager.shared.saveQuest(title: "Покататься на лошади",
                                         id: 7,
                                         category: category,
                                         stars: twoStar)
        
        CoreDataManager.shared.saveQuest(title: "Прыгнуть с веревкой",
                                         id: 8,
                                         category: category,
                                         stars: twoStar)
        
        CoreDataManager.shared.saveQuest(title: "Поход с палатками",
                                         id: 9,
                                         category: category,
                                         stars: twoStar)
        
        CoreDataManager.shared.saveQuest(title: "Постоять под водопадом",
                                         id: 10,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Круиз на теплоходе",
                                         id: 11,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Побывать на острове",
                                         id: 12,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Искупаться в проруби",
                                         id: 13,
                                         category: category,
                                         stars: twoStar)

        let threeStar = 3

        CoreDataManager.shared.saveQuest(title: "Увидеть северное сияние",
                                         id: 14,
                                         category: category,
                                         stars: threeStar)

        CoreDataManager.shared.saveQuest(title: "Покататься на серфинге",
                                         id: 15,
                                         category: category,
                                         stars: threeStar)
        
        CoreDataManager.shared.saveQuest(title: "Поплавать с аквалангом",
                                         id: 16,
                                         category: category,
                                         stars: threeStar)

        CoreDataManager.shared.saveQuest(title: "Полетать на кукурузнике",
                                         id: 17,
                                         category: category,
                                         stars: threeStar)
        
        CoreDataManager.shared.saveQuest(title: "Полетать на воздушном шаре",
                                         id: 18,
                                         category: category,
                                         stars: threeStar)

        CoreDataManager.shared.saveQuest(title: "Сделать тату",
                                         id: 19,
                                         category: category,
                                         stars: threeStar)
        
        CoreDataManager.shared.saveQuest(title: "Путешествие автостопом",
                                         id: 20,
                                         category: category,
                                         stars: threeStar)
        
        CoreDataManager.shared.saveQuest(title: "Прыгнуть с парашютом",
                                         id: 21,
                                         category: category,
                                         stars: threeStar)
        

        

        

        
    }
    
}
