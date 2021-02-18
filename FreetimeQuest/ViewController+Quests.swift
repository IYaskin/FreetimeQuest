//
//  ViewController+Quests.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import Foundation

extension ViewController {
    
    func getQuests() -> [QuestObject] {
        return CoreDataManager.shared.getQuests()
    }
//    
//    func getDoneQuests() -> [Quest] {
//        let quests = Quest.quests().compactMap { (quest) -> Quest? in
//            if quest.isDone {
//                return quest
//            } else {
//                return nil
//            }
//        }
//        return quests
//    }
//
//    func getNotDeletedQuests() -> [Quest] {
//        let quests = Quest.quests().compactMap { (quest) -> Quest? in
//            if !quest.isDeleted {
//                return quest
//            } else {
//                return nil
//            }
//        }
//        return quests
//    }
//
//    func getDoneQuestsFilteredByTime() -> [Quest] {
//        let quests = getDoneQuests().sorted {
//            $0.date < $1.date
//        }
//        return quests
//    }
//
//    func getCurrentQuest() -> Quest?  {
//        var quest: Quest?
//        getQuests().forEach {
//            if $0.isCurrent,
//               !$0.isDone,
//               !$0.isDeleted{
//                quest = $0
//            }
//        }
//        return quest
//    }
//
//    func clearQuests() {
//        Quest.quests().forEach {
//            $0.isDone = false
//            $0.isDeleted = false
//            $0.isCurrent = false
//        }
//    }

}
