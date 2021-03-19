//
//  CategoryViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 14.03.2021.
//

import UIKit

class CategoryViewController: UIViewController {
    
    weak var mainVC: ViewController?

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    private var starsCount: Int {
        
        get {
            return UserDefaultsManager.shared.starsCount
        }
        
        set {
            UserDefaultsManager.shared.starsCount = newValue
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        bgView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .systemYellow
        
        configureAdditionalQuestsStackView()
    }
    
    func updateTitle() {
        if stackView.subviews.count == 0 {
            titleLabel.text = "Все квесты добавлены!"
        } else {
            titleLabel.text = "Добавить квесты ★\(starsCount)"
        }
    }
    
    func configureAdditionalQuestsStackView() {
        stackView.subviews.forEach({
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
        
        if !UserDefaultsManager.shared.isHobbyQuestsSet {
            addButtonToStackView(category: .hobby)
        }
        
        if !UserDefaultsManager.shared.isTravelingQuestsSet {
            addButtonToStackView(category: .traveling)
        }
        
        if !UserDefaultsManager.shared.isHealthQuestsSet {
            addButtonToStackView(category: .health)
        }
        
        if !UserDefaultsManager.shared.isLiberationQuestsSet {
            addButtonToStackView(category: .liberation)
        }
        
        if !UserDefaultsManager.shared.isCharismaQuestsSet {
            addButtonToStackView(category: .charisma)
        }
        
        if !UserDefaultsManager.shared.isFoodQuestsSet {
            addButtonToStackView(category: .food)
        }

        
        updateTitle()
    }
    
    func addButtonToStackView(category: Category) {
        let button = UIButton()
        
        button.tag = category.rawValue
        button.setTitle("+ \(category.title) ★\(category.price)", for: .normal)
        button.setTitleColor(category.textColor, for: .normal)
        button.backgroundColor = category.cellColor
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 20
        stackView.addArrangedSubview(button)

    }
    
    @objc func buttonAction(sender: UIButton!) {
        guard let category = Category(rawValue: sender.tag) else {
            return
        }
        
        showAlert(title: "Купить \(category.title) за ★\(category.price)",
                  okButtonTitle: "Ок",
                  okAction: { _ in
                    self.addCategory(category)
                  },
                  cancelButtonTitle: "Отмена")
}
    
    func addCategory(_ category: Category) {
        if starsCount < category.price {
            showOkAlert(title: "Не хватает звезд :(",
                      message: "Выполните больше квестов, чтобы их заработать",
                      okButtonTitle: "Ок")
        } else {
            
            switch category {
            case .hobby:
                HobbyQuests.addQuests()
                UserDefaultsManager.shared.isHobbyQuestsSet = true
            case .traveling:
                TravelingQuests.addQuests()
                UserDefaultsManager.shared.isTravelingQuestsSet = true

            case .health:
                HealthQuests.addQuests()
                UserDefaultsManager.shared.isHealthQuestsSet = true

            case .liberation:
                LiberationQuests.addQuests()
                UserDefaultsManager.shared.isLiberationQuestsSet = true

            case .charisma:
                CharismaQuests.addQuests()
                UserDefaultsManager.shared.isCharismaQuestsSet = true
            case .food:
                FoodQuests.addQuests()
                UserDefaultsManager.shared.isFoodQuestsSet = true

            default:
                break
            }
            
            
            starsCount -= category.price
            configureAdditionalQuestsStackView()
            mainVC?.updateHeader()
            showOkAlert(title: "Квесты добавлены!",
                        okButtonTitle: "Ок")

        }

    }
    
    @IBAction func greyAreaTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
