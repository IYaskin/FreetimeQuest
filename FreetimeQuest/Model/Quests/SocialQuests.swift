//
//  SocialQuests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 10.03.2021.
//

import UIKit

class SocialQuests {
    
    static func addQuests() {
        
        let titles = ["Social.Smile",
                      "Social.Wink",
                      "Social.Ugly",
                      "Social.Hello",
                      "Social.Compliment",
                      "Social.Questions",
                      "Social.Call",
                      "Social.AskPhoto",
                      "Social.Selfie",
                      "Social.Oboznalsya",
                      "Social.ExchangeNumbers",
                      "Social.LoveLetter",
                      "Social.TellPoem",
                      "Social.Sing",
                      "Social.MeetSomeone",
                      "Social.AskSalt",
                      "Social.Wish",
                      "Social.Fountain",
                      "Social.Dance",
                      "Social.Party",
                      "Social.Picnic",
                      "Social.Stage"]

        for (id, title) in titles.enumerated() {
            let star = id < 14 ? 1 : 2
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
    
    static func getURLString(id: Int) -> String? {
        let urls: [String?] = [nil,
                               nil,
                               nil,
                               nil,
                               nil,
                               nil,
                               "Social.URL.Call",
                               nil,
                               nil,
                               nil,
                               nil,
                               "Social.URL.LoveLetter",
                               nil,
                               "Social.URL.Sing",
                               nil,
                               nil,
                               nil,
                               "Social.URL.Fountain",
                               nil,
                               nil,
                               nil,
                               nil]
        
        guard id >= 0 &&
              id <= urls.count else {
            return nil
        }
        
        guard let url = urls[id] else  {
            return nil
        }
        return NSLocalizedString(url, comment: "")

    }

    
}
