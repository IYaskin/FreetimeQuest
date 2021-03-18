//
//  QuestType.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

enum Category: Int {
    case freetimeQuest
    case goOut
    case adventure
    case brain
    case social
    case good
    
    // Допы
    // Раскрепощение
    // Путешествия
    // Здоровье
    // Харизма
    // Мои квесты
    // Кухня
    // Хобби
    //
}

extension Category {
        
    var cellColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .white
        case .good:
            return .lightGray
        case .goOut:
            return .orange
        case .social:
            return .purple
        case .brain:
            return .gray
        case .adventure:
            return .red
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .black
        case .good:
            return .black
        case .goOut:
            return .white
        case .social:
            return .white
        case .brain:
            return .white
        case .adventure:
            return .white
        }
    }
    
    var title: String {
        switch self {
        case .freetimeQuest:
            return "Freetime Quest"
        case .good:
            return "Добро"
        case .goOut:
            return "Посетить места"
        case .social:
            return "Социализация"
        case .brain:
            return "Мозг"
        case .adventure:
            return "Приключения"
        }
    }
    
    var headerTextColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .black
        case .good:
            return .black
        case .goOut:
            return .black
        case .social:
            return .white
        case .brain:
            return .white
        case .adventure:
            return .black
        }
    }
    
    var headerColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .white
        case .good:
            return .lightGray
        case .goOut:
            return .orange
        case .social:
            return .purple
        case .brain:
            return .gray
        case .adventure:
            return .red
        }
    }


}
