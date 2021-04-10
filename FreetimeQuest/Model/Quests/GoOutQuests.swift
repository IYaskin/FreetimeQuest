//
//  GoOutQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class GoOutQuests {
    
        
    static func addQuests() {
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
                                             category: Category.goOut.rawValue,
                                             stars: 1)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        let images = ["museum",
                      "theater",
                      "gallery",
                      "zoo",
                      "football",
                      "basketball",
                      "hockey",
                      "bowling",
                      "billiard",
                      "concert",
                      "quest",
                      "iceskating",
                      "karting",
                      "trampoline",
                      "aquapark",
                      "excursion",
                      "degustation",
                      "bar",
                      "nightclub",
                      "standup",
                      "sauna",
                      "show"]
        
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
        
    }
    
}
