//
//  QuestType.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

enum QuestType {
    case good
    case goOut
    case social
    case brain
    case adventure
}

//Colors

extension QuestType {
    var bgColor: UIColor {
        switch self {
        case .good:
            return .lightGray
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
}
