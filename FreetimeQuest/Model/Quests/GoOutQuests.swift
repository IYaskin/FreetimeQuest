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
        
        let titles = ["Музей",
                      "Театр",
                      "Галерея",
                      "Зоопарк",
                      "Футбол",
                      "Баскетбол",
                      "Хоккей",
                      "Боулинг",
                      "Бильярд",
                      "Концерт",
                      "Квест",
                      "Каток",
                      "Картинг",
                      "Батуты",
                      "Аквапарк",
                      "Экскурсия",
                      "Дегустация",
                      "Бар",
                      "Ночной клуб",
                      "Stand Up",
                      "Баня",
                      "Шоу"]
        
        for (id, title) in titles.enumerated() {
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: category,
                                             stars: star)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        switch id {
        case 0:
            return UIImage(named: "museum")
        case 1:
            return UIImage(named: "theater")
        case 2:
            return UIImage(named: "gallery")
        case 3:
            return UIImage(named: "zoo")
        case 4:
            return UIImage(named: "football")
        case 5:
            return UIImage(named: "basketball")
        case 6:
            return UIImage(named: "hockey")
        case 7:
            return UIImage(named: "bowling")
        case 8:
            return UIImage(named: "billiard")
        case 9:
            return UIImage(named: "concert")
        case 10:
            return UIImage(named: "quest")
        case 11:
            return UIImage(named: "iceskating")
            
        case 12:
            return UIImage(named: "karting")
        case 13:
            return UIImage(named: "trampoline")
        case 14:
            return UIImage(named: "aquapark")
        case 15:
            return UIImage(named: "excursion")
        case 16:
            return UIImage(named: "degustation")
        case 17:
            return UIImage(named: "bar")
        case 18:
            return UIImage(named: "nightclub")
        case 19:
            return UIImage(named: "standup")
        case 20:
            return UIImage(named: "sauna")
        case 21:
            return UIImage(named: "show")

        default:
            return nil
            
        }
    }
    
}
