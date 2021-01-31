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
    @IBOutlet weak var numberQuestLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentQuest: Quest?

    override func viewDidLoad() {
        super.viewDidLoad()
        clearQuests()
        setCurrentQuestIfNeeded()

        configureUI()
        printInfo()
    }
    
    func configureUI() {
        tableView.dataSource = self
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
        
        doneQuestsLabel.text = ""
        updateDoneQuestsLabel()
        updateNumberQuestsLabel()
    }
    
    func updateDoneQuestsLabel() {
        let doneQuestsCount = getDoneQuests().count
        let notDeletedQuests = getNotDeletedQuests().count
        doneQuestsLabel.text = "Выполнено \(doneQuestsCount) из \(notDeletedQuests) квестов"
    }
    
    func updateNumberQuestsLabel() {
        if let currentQuest = currentQuest {
            numberQuestLabel.text = "№\(currentQuest.number)"
        } else {
            numberQuestLabel.text = ""
        }
    }
    
    func setCurrentQuestIfNeeded() {
        if let currentQuest = getCurrentQuest() {
            self.currentQuest = currentQuest
            getQuestButton.isHidden = true
            questTitleLabel.text = currentQuest.title
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
        updateDoneQuestsLabel()
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
        printInfo()
        
        currentQuest?.isCurrent = false
        currentQuest?.isDeleted = true
        currentQuest = nil

        questTitleLabel.text = ""
        getQuestButton.isHidden = false

        printInfo()
        print("---Удалить---")
        updateDoneQuestsLabel()
    }
    
    func setRandomQuest() {
        guard let randomQuest = getQuests().randomElement() else {
            return
        }
        randomQuest.isCurrent = true
        currentQuest = randomQuest
        questTitleLabel.text = randomQuest.title
        questBgView.backgroundColor = randomQuest.type.bgColor
        updateNumberQuestsLabel()
    }
    
    
}

