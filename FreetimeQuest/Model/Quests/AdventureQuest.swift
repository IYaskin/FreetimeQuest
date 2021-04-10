//
//  AdventureQuest.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class AdventureQuests {
    
    static func addQuests() {
        let titles = ["Встретить рассвет",//0
                      "Сделать ставку на матч",
                      "Покататься по ночному городу",
                      "Посетить парк аттракционов",
                      "Покататься на сноуборде",
                      "Увидеть звездопад",
                      
                      "Покататься на лошади",//6
                      "Прыгнуть с веревкой",
                      "Поход с палатками",
                      "Постоять под водопадом",
                      "Круиз на теплоходе",
                      "Побывать на острове",
                      "Искупаться в проруби",
                      
                      "Увидеть северное сияние",//13
                      "Покататься на серфинге",
                      "Поплавать с аквалангом",
                      "Полетать на кукурузнике",
                      "Полетать на воздушном шаре",
                      "Сделать тату",
                      "Путешествие автостопом",
                      "Прыгнуть с парашютом"]
        
        for (id, title) in titles.enumerated() {
            var star = 1
            if id >= 6 && id < 13 {
                star = 2
            } else if id >= 13 {
                star = 3
            }

            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.adventure.rawValue,
                                             stars: star)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        let images = ["sunrise",
                      "betting",
                      "nightride",
                      "parkattraction",
                      "snowboard",
                      "stars",
                      
                      "horse",
                      "rope",
                      "tents",
                      "waterfall",
                      "cruise",
                      "island",
                      "prorub",
                      
                      "northernlights",
                      "surfing",
                      "scuba",
                      "plane",
                      "balloon",
                      "tattoo",
                      "autostop",
                      "parachute"]

        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }

    }

    
}
