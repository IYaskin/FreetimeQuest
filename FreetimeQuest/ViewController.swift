//
//  ViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
//        CoreDataManager.shared.saveQuest(title: "Посетить музей",
//                                         id: 1,
//                                         category: Category.goOut.rawValue)
//        CoreDataManager.shared.saveQuest(title: "Посетить театр",
//                                         id: 1,
//                                         category: Category.goOut.rawValue)
//        CoreDataManager.shared.saveQuest(title: "Посетить оперу",
//                                         id: 1,
//                                         category: Category.goOut.rawValue)
//
//        CoreDataManager.shared.saveQuest(title: "Посадить растение",
//                                         id: 1,
//                                         category: Category.brain.rawValue)
//
//        CoreDataManager.shared.saveQuest(title: "Сделать татуировку",
//                                         id: 1,
//                                         category: Category.adventure.rawValue)

        //deleteQuests()
        printQuests()
        
        stackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        let goOutView = CategoryView()
        goOutView.configureWith(category: .goOut)
        stackView.addArrangedSubview(goOutView)

        let brainView = CategoryView()
        brainView.configureWith(category: .brain)
        stackView.addArrangedSubview(brainView)

        let goodView = CategoryView()
        goodView.configureWith(category: .good)
        stackView.addArrangedSubview(goodView)

        let socialView = CategoryView()
        socialView.configureWith(category: .social)
        stackView.addArrangedSubview(socialView)
        
        let adventureView = CategoryView()
        adventureView.configureWith(category: .adventure)
        stackView.addArrangedSubview(adventureView)

    }
    
}

