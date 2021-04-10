//
//  Charisma.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 19.03.2021.
//

import UIKit

class CharismaQuests {
    
    static func addQuests() {
        
        let titles = ["Вылечить зубы",//0
                      "Сходить на 8 сеансов массажа",
                      "Заниматься йогой в течении месяца",
                      "Медитировать в течении месяца",
                      "Развивать речь в течении месяца",
                      "Развивать осанку в течении месяца",
                      "Закаляться в течении месяца",
                      "Делать зарядку в течении месяца",
                      "Правильно питаться в течении месяца",
                      "Прочитать 5 книг по развитию или по работе",
                      "Повысить свой доход",
                      "Устроить себе фотосессию",
                      "Сходить на сеанс к психологу",
                      "Купить себе то, что давно хочешь",
                      
                      "Достичь своего идеального веса", //14
                      "Пробежать полумарафон",
                      "Избавиться от вредной привычки"]

        for (id, title) in titles.enumerated() {
            let star = id <= 13 ? 2 : 3
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.charisma.rawValue,
                                             stars: star)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        
        let images = ["teeth",
                      "massage",
                      "yoga",
                      "meditation",
                      "speaking",
                      "posture",
                      "zakalka",
                      "zaryadka",
                      "goodfood",
                      "5books",
                      "money",
                      "photosession",
                      "psycholog",
                      "buything",
                      "perfectweight",
                      "marathon",
                      "badhabbit"]
        
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }

    }

}
