//
//  SocialQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import Foundation

class SocialQuests {
    
    static func addQuests() {
        let star = 1
        let category = Category.social.rawValue

        CoreDataManager.shared.saveQuest(title: "Улыбнуться прохожему",
                                         id: 1,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Подмигнуть прохожему",
                                         id: 2,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Скорчить рожицу прохожему",
                                         id: 3,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Задать 10 вопросов прохожим за прогулку",
                                         id: 4,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Позвонить в любую организацию и рассказать анекдот",
                                         id: 5,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Попросить прохожего вас сфотографировать",
                                         id: 6,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сделать селфи с незнакомым человеком",
                                         id: 7,
                                         category: category,
                                         stars: star)
        
        CoreDataManager.shared.saveQuest(title: "Сделать комплимент прохожему",
                                         id: 8,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Сказать \"Здравствуйте\" прохожему",
                                         id: 9,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Сделать вид, что обознались",
                                         id: 10,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Обменяться телефонами",
                                         id: 11,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Отправить любовное письмо по почте",
                                         id: 12,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Рассказать кому-нибудь стихотворение",
                                         id: 13,
                                         category: category,
                                         stars: star)

        CoreDataManager.shared.saveQuest(title: "Спеть для кого-нибудь",
                                         id: 14,
                                         category: category,
                                         stars: star)

        let twoStar = 2

        CoreDataManager.shared.saveQuest(title: "Завязать знакомство",
                                         id: 15,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Одолжить соль у соседей",
                                         id: 16,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Пожелать приятной дороги в транспорте",
                                         id: 17,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Искупаться в фонтане",
                                         id: 18,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Потанцевать на улице",
                                         id: 19,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Устроить вечеринку",
                                         id: 20,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Устроить пикник",
                                         id: 21,
                                         category: category,
                                         stars: twoStar)

        CoreDataManager.shared.saveQuest(title: "Выступить на сцене",
                                         id: 22,
                                         category: category,
                                         stars: twoStar)

    }
    
}
