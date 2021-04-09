//
//  GoOutQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class GoOutQuests {
    
        
    static func addQuests() {
        let star = 1
        let category = Category.goOut.rawValue
        
        CoreDataManager.shared.saveQuest(title: "Музей",
                                         id: 1,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Театр",
                                         id: 2,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Галерея",
                                         id: 3,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Зоопарк",
                                         id: 4,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Футбол",
                                         id: 5,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Баскетбол",
                                         id: 6,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Хоккей",
                                         id: 7,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Боулинг",
                                         id: 8,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Бильярд",
                                         id: 9,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Концерт",
                                         id: 10,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Квест",
                                         id: 11,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Каток",
                                         id: 12,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Картинг",
                                         id: 13,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Батуты",
                                         id: 14,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Аквапарк",
                                         id: 15,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Экскурсия",
                                         id: 16,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Дегустация",
                                         id: 17,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Бар",
                                         id: 18,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Ночной клуб",
                                         id: 19,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Stand Up",
                                         id: 20,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Баня",
                                         id: 21,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Шоу",
                                         id: 22,
                                         category: category,
                                         stars: star)

    }
    
    static func getIcon(id: Int) -> UIImage? {
        switch id {
        case 1:
            return UIImage(named: "museum")
        case 2:
            return UIImage(named: "theater")
        case 3:
            return UIImage(named: "gallery")
        case 4:
            return UIImage(named: "zoo")
        case 5:
            return UIImage(named: "football")
        case 6:
            return UIImage(named: "basketball")
        case 7:
            return UIImage(named: "hockey")
        case 8:
            return UIImage(named: "bowling")
        case 9:
            return UIImage(named: "billiard")
        case 10:
            return UIImage(named: "concert")
        case 11:
            return UIImage(named: "quest")
        case 12:
            return UIImage(named: "iceskating")
            
        case 13:
            return UIImage(named: "karting")
        case 14:
            return UIImage(named: "trampoline")
        case 15:
            return UIImage(named: "aquapark")
        case 16:
            return UIImage(named: "excursion")
        case 17:
            return UIImage(named: "degustation")
        case 18:
            return UIImage(named: "bar")
        case 19:
            return UIImage(named: "nightclub")
        case 20:
            return UIImage(named: "standup")
        case 21:
            return UIImage(named: "sauna")
        case 22:
            return UIImage(named: "show")

        default:
            return nil
            
        }
    }
    
}
