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
    case social
    case brain
    case good

}

extension Category {
    
    var bgColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .yellow
        case .good:
            return .lightGray
        case .goOut:
            return UIColor.orange.withAlphaComponent(0.5)
        case .social:
            return UIColor.blue.withAlphaComponent(0.5)
        case .brain:
            return UIColor.gray.withAlphaComponent(0.5)
        case .adventure:
            return UIColor.red.withAlphaComponent(0.5)
        }
    }
    
    var cellColor: UIColor {
        switch self {
        case .freetimeQuest:
            return .white
        case .good:
            return .gray
        case .goOut:
            return .orange
        case .social:
            return .blue
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
            return .white
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
            return "Выход в свет"
        case .social:
            return "Социализация"
        case .brain:
            return "Мозг"
        case .adventure:
            return "Приключения"
        }
    }

}
