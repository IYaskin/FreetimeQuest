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
    
    var quests: [Quest] {
        return getQuests()
    }
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        doneQuestsLabel.text = "Выполнено 0 из 100 квестов"
        
        clearQuests()
        
//        if quests.isEmpty {
//            getQuestButton.isEnabled = false
//        }
    }
    
    private func clearQuests() {
        Quest.quests().forEach {
            $0.isDone = false
        }
    }
    
    @IBAction func getQuestTapped(_ sender: UIButton) {
        print("Получить")
        print(quests.map({ (quest) -> String in
            return quest.title
        }))
        if quests.isEmpty {
            getQuestButton.isEnabled = false
            buttonsStackView.isUserInteractionEnabled = false
        } else {
            getQuestButton.isHidden = true
            setRandomQuest()
        }
    }

    @IBAction func doneQuestTapped(_ sender: UIButton) {
        print("Готово")
        currentQuest?.isCurrent = false
        currentQuest?.isDone = true

        questTitleLabel.text = ""
        questBgView.backgroundColor = .white
        getQuestButton.isHidden = false
    }
    
    @IBAction func changeQuestTapped(_ sender: UIButton) {
        print("Поменять")
        setRandomQuest()
    }
    @IBAction func deleteQuestTapped(_ sender: UIButton) {
        print("Удалить")
    }
    
    func setRandomQuest() {
        guard let randomQuest = quests.randomElement() else{
            return
        }
        questTitleLabel.text = randomQuest.title
        currentQuest = randomQuest
    }
    
    
}

