//
//  Text.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 16.04.2021.
//

import Foundation

class Text {
    
    static let lang = NSLocalizedString("lang", comment: "")

    static var isRussian: Bool {
        return lang == "ru"
    }
    
    static let AddCategory = NSLocalizedString("AddCategory", comment: "")
    static let AllCategoriesAdded = NSLocalizedString("AllCategoriesAdded", comment: "")
    static let AddQuest = NSLocalizedString("AddQuest", comment: "")

    static let Add = NSLocalizedString("Add", comment: "")
    static let _for = NSLocalizedString("for", comment: "")
    static let from = NSLocalizedString("from", comment: "")
    static let Ok = NSLocalizedString("Ok", comment: "")
    static let Cancel = NSLocalizedString("Cancel", comment: "")
    
    static let Skip = NSLocalizedString("Skip", comment: "")
    static let Next = NSLocalizedString("Next", comment: "")
    static let Start = NSLocalizedString("Start", comment: "")

    static let NotEnoughStars = NSLocalizedString("NotEnoughStars", comment: "")
    static let DoMoreQuests = NSLocalizedString("DoMoreQuests", comment: "")
    
    static let IncorrectName = NSLocalizedString("IncorrectName", comment: "")
    static let QuestsAdded = NSLocalizedString("QuestsAdded", comment: "")
    static let MyQuestAdded = NSLocalizedString("MyQuestAdded", comment: "")

    static let Memories = NSLocalizedString("Memories", comment: "")
    static let EnterQuestName = NSLocalizedString("EnterQuestName", comment: "")
    static let CompleteQuest = NSLocalizedString("CompleteQuest", comment: "")
    static let DeleteQuest = NSLocalizedString("DeleteQuest", comment: "")
    static let Completed = NSLocalizedString("Completed", comment: "")
    
    //Onboarding
    static let CompleteQuests = NSLocalizedString("CompleteQuests", comment: "")
    static let AddQuests = NSLocalizedString("AddQuests", comment: "")
    static let CreateMemories = NSLocalizedString("CreateMemories", comment: "")

    static let CompleteQuestsDescription = NSLocalizedString("CompleteQuestsDescription", comment: "")
    static let AddQuestsDescription = NSLocalizedString("AddQuestsDescription", comment: "")
    static let CreateMemoriesDescription = NSLocalizedString("CreateMemoriesDescription", comment: "")

    //GIF
    static let CreateGIF = NSLocalizedString("CreateGIF", comment: "")
    static let AtLeastTwoImage = NSLocalizedString("AtLeastTwoImage", comment: "")
    static let CreatingGIFFrom = NSLocalizedString("CreatingGIFFrom", comment: "")
    static let photo = NSLocalizedString("photo", comment: "")
    static let GIFCreated = NSLocalizedString("GIFCreated", comment: "")
    static let GIFNotCreated = NSLocalizedString("GIFNotCreated", comment: "")
}
