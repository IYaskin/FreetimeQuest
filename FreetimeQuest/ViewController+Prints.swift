//
//  ViewController+Prints.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import Foundation

extension ViewController {
    
    func printInfo() {
        printQuests()
        printСurrentQuest()
        printСurrentQuests()
    }
    
    func printСurrentQuest() {
        print("Текущий квест \(currentQuest?.title ?? "нет")")
    }
    
    func printСurrentQuests() {
        print("Текущие квесты:")
        getQuests().forEach {
            if $0.isCurrent {
                print($0.title)
            }
        }
    }
    
    func printQuests() {
        print("Оставшиеся квесты:")
        print(getQuests().map({ (quest) -> String in
            return quest.title
        }))
    }
}
