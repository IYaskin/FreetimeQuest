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
        
        let titles = ["Помочь донести пакет",
                      "Покормить уточек",
                      "Покормить бездомных животных",
                      "Отдать старые вещи нуждающимся",
                      "Перечислить любую сумму в фонд помощи",
                      "Купить подарок близкому человеку",
                      "Поставить оценку этому приложению",
                      "Сдать кровь для донорства",
                      "Поднять мусор",
                      "Перевести бабушку через дорогу",
                      "Сделать и повесить скворечник",
                      "Устроить семейный ужин",
                      "Угостить друзей",
                      "Отремонтировать что-то дома",
                      "Дать денег уличному музыканту",
                      "Купить еду бездомному"]

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
            return UIImage(named: "carrybag")
        case 1:
            return UIImage(named: "duck")
        case 2:
            return UIImage(named: "animals")
        case 3:
            return UIImage(named: "oldstuff")
        case 4:
            return UIImage(named: "helpfond")
        case 5:
            return UIImage(named: "buygift")
        case 6:
            return UIImage(named: "appmark")
        case 7:
            return UIImage(named: "blood")

        case 8:
            return UIImage(named: "trash")
        case 9:
            return UIImage(named: "helpold")
        case 10:
            return UIImage(named: "birdhouse")
        case 11:
            return UIImage(named: "dinner")
        case 12:
            return UIImage(named: "feedfriends")
        case 13:
            return UIImage(named: "fixhouse")
        case 14:
            return UIImage(named: "musician")
        case 15:
            return UIImage(named: "homeless")

        default:
            return nil
        }
    }

    
}
