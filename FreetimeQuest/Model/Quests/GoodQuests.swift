//
//  GoodQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class GoodQuests {
    
    static func addQuests() {
        let star = 1
        let category = Category.good.rawValue

        CoreDataManager.shared.saveQuest(title: "Помочь донести пакет",
                                         id: 1,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Покормить уточек",
                                         id: 2,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Покормить бездомных животных",
                                         id: 3,
                                         category: category,
                                         stars: star)

        
        CoreDataManager.shared.saveQuest(title: "Отдать старые вещи нуждающимся",
                                         id: 4,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Перечислить любую сумму в фонд помощи",
                                         id: 5,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Купить подарок близкому человеку",
                                         id: 6,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Поставить оценку этому приложению",
                                         id: 7,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сдать кровь для донорства",
                                         id: 8,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Поднять мусор",
                                         id: 9,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Перевести бабушку через дорогу",
                                         id: 10,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сделать и повесить скворечник",
                                         id: 11,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Устроить семейный ужин",
                                         id: 12,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Угостить друзей",
                                         id: 13,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Отремонтировать что-то дома",
                                         id: 14,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Дать денег уличному музыканту",
                                         id: 15,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Купить еду бездомному",
                                         id: 16,
                                         category: category,
                                         stars: star)

    }
    
    static func getIcon(id: Int) -> UIImage? {
        switch id {
        case 1:
            return UIImage(named: "carrybag")
        case 2:
            return UIImage(named: "duck")
        case 3:
            return UIImage(named: "animals")
        case 4:
            return UIImage(named: "oldstuff")
        case 5:
            return UIImage(named: "helpfond")
        case 6:
            return UIImage(named: "buygift")
        case 7:
            return UIImage(named: "appmark")
        case 8:
            return UIImage(named: "blood")

        case 9:
            return UIImage(named: "trash")
        case 10:
            return UIImage(named: "helpold")
        case 11:
            return UIImage(named: "birdhouse")
        case 12:
            return UIImage(named: "dinner")
        case 13:
            return UIImage(named: "feedfriends")
        case 14:
            return UIImage(named: "fixhouse")
        case 15:
            return UIImage(named: "musician")
        case 16:
            return UIImage(named: "homeless")

        default:
            return nil
        }
    }

    
}
