//
//  BrainQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class HobbyQuests {

    static func addQuests() {
        let star = 1
        let category = Category.hobby.rawValue

        CoreDataManager.shared.saveQuest(title: "Сыграть в шашки",
                                         id: 1,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сыграть в шахматы",
                                         id: 2,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сыграть в нарды",
                                         id: 3,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сыграть в покер",
                                         id: 4,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сыграть в дартс",
                                         id: 5,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сыграть в настольную игру",
                                         id: 6,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Собрать паззл",
                                         id: 7,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Пройти компьютерную игру",
                                         id: 8,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Нарисовать картину",
                                         id: 9,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Слепить что-то из глины или гипса",
                                         id: 10,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Прочитать роман",
                                         id: 11,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Прочитать детектив",
                                         id: 12,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Прочитать фантастику",
                                         id: 13,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Прочитать фэнтези",
                                         id: 14,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Выучить стихотворение",
                                         id: 15,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Написать стихотворение",
                                         id: 16,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Сделать красивое фото, вставить в рамку",
                                         id: 17,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Провести день без гаджетов",
                                         id: 18,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Посадить растение",
                                         id: 19,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Запустить воздушного змея",
                                         id: 20,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Заказать свой портрет",
                                         id: 21,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Сходить на пробное занятие в секцию",
                                         id: 22,
                                         category: category,
                                         stars: star)
        
    }
    
    static func getIcon(id: Int) -> UIImage? {
        switch id {
        case 1:
            return UIImage(named: "checkers")
        case 2:
            return UIImage(named: "chess")
        case 3:
            return UIImage(named: "nards")
        case 4:
            return UIImage(named: "poker")
        case 5:
            return UIImage(named: "darts")
        case 6:
            return UIImage(named: "tablegame")
        case 7:
            return UIImage(named: "puzzle")
        case 8:
            return UIImage(named: "computergame")
        case 9:
            return UIImage(named: "painting")
        case 10:
            return UIImage(named: "sculpting")

        case 11:
            return UIImage(named: "readroman")
        case 12:
            return UIImage(named: "readdetective")
        case 13:
            return UIImage(named: "readfiction")
        case 14:
            return UIImage(named: "readfantasy")
        case 15:
            return UIImage(named: "memberpoem")
        case 16:
            return UIImage(named: "writepoem")

        case 17:
            return UIImage(named: "photo")
        case 18:
            return UIImage(named: "nogadgets")
        case 19:
            return UIImage(named: "plant")
        case 20:
            return UIImage(named: "kite")
        case 21:
            return UIImage(named: "portrait")
        case 22:
            return UIImage(named: "freesection")

        default:
            return nil
        }
    }

    
}
