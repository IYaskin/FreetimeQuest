//
//  QuestsList.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import Foundation

extension Quest {
    
    static func quests() -> [Quest] {
        var quests = [Quest]()
        quests.append(museum)
        quests.append(craftBeer)
        quests.append(smile)
        quests.append(helpCarryBag)
        quests.append(tatoo)

        return quests
    }
    
    static let museum: Quest = Quest(title: "Посетить музей",
                                          key: "Museum",
                                          number: 1,
                                          type: .goOut)
    static let craftBeer: Quest = Quest(title: "Приготовить домашний квас",
                                          key: "Beer",
                                          number: 2,
                                          type: .brain)
    static let smile: Quest = Quest(title: "Улыбнуться прохожему",
                                          key: "Smile",
                                          number: 3,
                                          type: .social)
    static let helpCarryBag: Quest = Quest(title: "Помочь донести пакет",
                                          key: "HelpCarryBag",
                                          number: 4,
                                          type: .good)
    static let tatoo: Quest = Quest(title: "Сделать татуировку",
                                          key: "Tatoo",
                                          number: 5,
                                          type: .adventure)

}
