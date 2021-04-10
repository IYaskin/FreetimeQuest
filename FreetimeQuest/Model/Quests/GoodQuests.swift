//
//  GoodQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class GoodQuests {
    
    static func addQuests() {
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
                                             category: Category.good.rawValue,
                                             stars: 1)
        }
        
    }
    
    static func getIcon(id: Int) -> UIImage? {
        let images = ["carrybag",
                      "duck",
                      "animals",
                      "oldstuff",
                      "helpfond",
                      "buygift",
                      "appmark",
                      "blood",
                      "trash",
                      "helpold",
                      "birdhouse",
                      "dinner",
                      "feedfriends",
                      "fixhouse",
                      "musician",
                      "homeless"]
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
    }

    
}
