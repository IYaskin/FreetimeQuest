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

        CoreDataManager.shared.saveQuest(title: "Выучить стихотворение",
                                         id: 14,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Сделать красивое фото, вставить в рамку",
                                         id: 15,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Провести день без гаджетов",
                                         id: 16,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Посадить растение",
                                         id: 17,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Запустить воздушного змея",
                                         id: 18,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Заказать свой портрет",
                                         id: 19,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Сходить на пробное занятие в секцию",
                                         id: 20,
                                         category: category,
                                         stars: star)
        
    }
    
    static func getIcon(id: Int) -> UIImage? {
        switch id {
        case 1:
            return UIImage(named: "icon")

        default:
            return UIImage(named: "icon")
        }
    }

    
}
