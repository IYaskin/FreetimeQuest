//
//  SocialQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class SocialQuests {
    
    static func addQuests() {
        let star = 1
        let category = Category.social.rawValue
        
        //let titles = []

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
    
    static func getIcon(id: Int) -> UIImage? {
        switch id {
        case 1:
            return UIImage(named: "smile")
        case 2:
            return UIImage(named: "blink")
        case 3:
            return UIImage(named: "uglyface")
        case 4:
            return UIImage(named: "10questions")
        case 5:
            return UIImage(named: "anekdot")
        case 6:
            return UIImage(named: "socialphoto")
        case 7:
            return UIImage(named: "selfi")
        case 8:
            return UIImage(named: "compliment")
        case 9:
            return UIImage(named: "sayhello")
        case 10:
            return UIImage(named: "oboznalsya")
            
        case 11:
            return UIImage(named: "exchangenumbers")
        case 12:
            return UIImage(named: "loveletter")
        case 13:
            return UIImage(named: "tellpoem")
        case 14:
            return UIImage(named: "sing")
        case 15:
            return UIImage(named: "meetsomeone")
        case 16:
            return UIImage(named: "askforsalt")
        case 17:
            return UIImage(named: "wishGoodTrip")
        case 18:
            return UIImage(named: "swimInFountain")
        case 19:
            return UIImage(named: "danceOnStreet")
        case 20:
            return UIImage(named: "makeParty")
        case 21:
            return UIImage(named: "makePicnic")
        case 22:
            return UIImage(named: "stage")
        default:
            return UIImage(named: "icon")
        }
    }

    
}
