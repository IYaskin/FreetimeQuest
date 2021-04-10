//
//  SocialQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class SocialQuests {
    
    static func addQuests() {
        
        let titles = ["Улыбнуться прохожему",//0
                      "Подмигнуть прохожему",
                      "Скорчить рожицу прохожему",
                      "Сказать \"Здравствуйте\" прохожему",
                      "Сделать комплимент прохожему",
                      "Задать 10 вопросов прохожим за прогулку",
                      "Позвонить в любую организацию и рассказать анекдот",
                      "Попросить прохожего вас сфотографировать",
                      "Сделать селфи с незнакомым человеком",
                      "Сделать вид, что обознались",
                      "Обменяться телефонами",
                      "Отправить любовное письмо по почте",
                      "Рассказать кому-нибудь стихотворение",
                      "Спеть для кого-нибудь",
                      
                      "Завязать знакомство",//14
                      "Одолжить соль у соседей",
                      "Пожелать приятной дороги в транспорте",
                      "Искупаться в фонтане",
                      "Потанцевать на улице",
                      "Устроить вечеринку",
                      "Устроить пикник",
                      "Выступить на сцене"]

        for (id, title) in titles.enumerated() {
            let star = id <= 13 ? 1 : 2
            CoreDataManager.shared.saveQuest(title: title,
                                             id: id,
                                             category: Category.social.rawValue,
                                             stars: star)
        }

    }
    
    static func getIcon(id: Int) -> UIImage? {
        
        let images = ["smile",
                      "wink",
                      "ugly",
                      "hello",
                      "compliment",
                      "questions",
                      "anekdot",
                      "socialphoto",
                      "selfie",
                      "oboznalsya",
                      "exchangenumbers",
                      "letter",
                      "tellpoem",
                      "sing",
                      "meetsomeone",
                      "salt",
                      "wishgoodtrip",
                      "fountain",
                      "dance",
                      "party",
                      "picnic",
                      "stage"]
        
        if id >= 0 && id <= images.count {
            return UIImage(named: images[id])
        } else {
            return nil
        }
        
    }

    
}
