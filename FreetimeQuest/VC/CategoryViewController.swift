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
    
    // Prices
    private let hobbyPrice = 10
        
        
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
        
        updateTitle()
    }
    
    func addButtonToStackView(category: Category) {
        let hobbyButton = UIButton()
        var title = ""
        var bgColor: UIColor = .white
        
        switch category {
        case .hobby:
            title = "+ Хобби ★\(hobbyPrice)"
            hobbyButton.tag = category.rawValue
            bgColor = .brown
        default:
            break
        }
        hobbyButton.setTitle(title, for: .normal)
        hobbyButton.backgroundColor = bgColor
        hobbyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        hobbyButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        stackView.addArrangedSubview(hobbyButton)

    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        if sender.tag == Category.hobby.rawValue {
            
            showAlert(title: "Купить \(Category.hobby.title) за ★\(hobbyPrice)",
                      okButtonTitle: "Ок",
                      okAction: { _ in
                        self.addCategory()
                      },
                      cancelButtonTitle: "Отмена")
            
            print("Hobby")
        }
        
    }
    
    func addCategory() {
        if starsCount < hobbyPrice {
            showOkAlert(title: "Не хватает звезд :(",
                      message: "Выполните больше квестов, чтобы их заработать",
                      okButtonTitle: "Ок")
        } else {
            HobbyQuests.addQuests()
            UserDefaultsManager.shared.isHobbyQuestsSet = true
            starsCount -= hobbyPrice
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
