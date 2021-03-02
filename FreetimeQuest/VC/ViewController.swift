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
//        deleteQuests()
        addQuests()
//        addQuests()
//        addQuests()
        //deleteQuests()
        //printQuests()
        
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        
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

