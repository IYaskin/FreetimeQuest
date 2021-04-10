//
//  BrainQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class HobbyQuests {

    static func addQuests() {
        let titles = ["Сыграть в шашки",
                      "Сыграть в шахматы",
                      "Сыграть в нарды",
                      "Сыграть в покер",
                      "Сыграть в дартс",
                      "Сыграть в настольную игру",
                      "Собрать паззл",
                      "Пройти компьютерную игру",
                      "Нарисовать картину",
                      "Слепить что-то из глины или гипса",
                      "Прочитать роман",
                      "Прочитать детектив",
                      "Прочитать фантастику",
                      "Прочитать фэнтези",
                      "Выучить стихотворение",
                      "Написать стихотворение",
                      "Сделать красивое фото, вставить в рамку",
                      "Провести день без гаджетов",
                      "Посадить растение",
                      "Запустить воздушного змея",
                      "Заказать свой портрет",
                      "Сходить на пробное занятие в секцию"]
        
        for (id, title) in titles.enumerated() {
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.hobby.rawValue,
                                             stars: 1)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        
        let images = ["checkers",
                      "chess",
                      "nards",
                      "poker",
                      "darts",
                      "tablegame",
                      "puzzle",
                      "computergame",
                      "painting",
                      "sculpting",
                      "readroman",
                      "readdetective",
                      "readfiction",
                      "readfantasy",
                      "memberpoem",
                      "writepoem",
                      "photo",
                      "nogadgets",
                      "plant",
                      "kite",
                      "portrait",
                      "freesection"]
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
    }

    
}
