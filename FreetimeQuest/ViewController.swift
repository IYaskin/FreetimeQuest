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
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Freetime Quest"
        questTitleLabel.text = "Посетить музей"
        doneQuestButton.setTitle("Готово", for: .normal)
        changeQuestButton.setTitle("Поменять", for: .normal)
        deleteQuestButton.setTitle("Удалить", for: .normal)
        getQuestButton.setTitle("Взять квест", for: .normal)
        getQuestButton.backgroundColor = .black
        getQuestButton.tintColor = .yellow
    }

    @IBAction func doneQuestTapped(_ sender: UIButton) {
        print("Готово")
    }
    @IBAction func changeQuestTapped(_ sender: UIButton) {
        print("Поменять")
    }
    @IBAction func deleteQuestTapped(_ sender: UIButton) {
        print("Удалить")
    }
    @IBAction func getQuestTapped(_ sender: UIButton) {
        print("Получить")
        getQuestButton.isHidden = true
    }
    
}

