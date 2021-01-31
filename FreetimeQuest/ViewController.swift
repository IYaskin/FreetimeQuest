//
//  ViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var questBgView: UIView!
    @IBOutlet weak var questTitleLabel: UILabel!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var doneQuestButton: UIButton!
    @IBOutlet weak var changeQuestButton: UIButton!
    @IBOutlet weak var deleteQuestButton: UIButton!
    @IBOutlet weak var getQuestButton: UIButton!
    
    @IBOutlet weak var doneQuestsLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    func getQuests() -> [Quest] {
        let quests = Quest.quests().compactMap { (quest) -> Quest? in
            if !quest.isDone && !quest.isDeleted {
                return quest
            } else {
                return nil
            }
        }
        return quests
    }
    
    var currentQuest: Quest?
    func getCurrentQuest() -> Quest?  {
        var quest: Quest?
        getQuests().forEach {
            if $0.isCurrent,
               !$0.isDone,
               !$0.isDeleted{
                quest = $0
            }
        }
        return quest
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questBgView.layer.cornerRadius = 30
        
        titleLabel.text = "Freetime Quest"
        questTitleLabel.text = "Посетить музей"
        
        doneQuestButton.setTitle("Готово", for: .normal)
        changeQuestButton.setTitle("Поменять", for: .normal)
        deleteQuestButton.setTitle("Удалить", for: .normal)
        
        getQuestButton.backgroundColor = .black
        getQuestButton.setTitle("Взять квест", for: .normal)
        getQuestButton.tintColor = .yellow
        getQuestButton.setTitle("Поздравляю! Вы прошли все квесты!", for: .disabled)
        getQuestButton.setTitleColor(.green, for: .disabled)
        getQuestButton.layer.cornerRadius = 30
        
        doneQuestsLabel.text = "Выполнено 0 из 100 квестов"
        
        clearQuests()
        setCurrentQuestIfNeeded()
        
        printInfo()
//        if quests.isEmpty {
//            getQuestButton.isEnabled = false
//        }
    }
    
    func setCurrentQuestIfNeeded() {
        if let currentQuest = getCurrentQuest() {
            self.currentQuest = currentQuest
            getQuestButton.isHidden = true
            questTitleLabel.text = currentQuest.title
        }
    }
    
    func clearQuests() {
        Quest.quests().forEach {
            $0.isDone = false
            $0.isDeleted = false
            $0.isCurrent = false
        }
    }
    
    
    @IBAction func getQuestTapped(_ sender: UIButton) {
        print("\n---Получить---")
        printInfo()

        if getQuests().isEmpty {
            getQuestButton.isEnabled = false
            buttonsStackView.isUserInteractionEnabled = false
            currentQuest = nil
        } else {
            getQuestButton.isHidden = true
            setRandomQuest()
        }
        
        printInfo()
        print("---Получить---\n")

    }
    

    @IBAction func doneQuestTapped(_ sender: UIButton) {
        print("\n---Готово---")
        printInfo()

        currentQuest?.isCurrent = false
        currentQuest?.isDone = true
        currentQuest = nil

        questTitleLabel.text = ""
        getQuestButton.isHidden = false

        printInfo()
        print("---Готово---\n")

    }
    
    @IBAction func changeQuestTapped(_ sender: UIButton) {
        print("\n---Поменять---")
        printInfo()

        currentQuest?.isCurrent = false
        currentQuest = nil

        setRandomQuest()
        
        printInfo()
        print("---Поменять---\n")
    }
    @IBAction func deleteQuestTapped(_ sender: UIButton) {
        print("---Удалить---")
    }
    
    func setRandomQuest() {
        guard let randomQuest = getQuests().randomElement() else {
            return
        }
        randomQuest.isCurrent = true
        currentQuest = randomQuest
        questTitleLabel.text = randomQuest.title
        questBgView.backgroundColor = randomQuest.type.bgColor
    }
    
    
}

