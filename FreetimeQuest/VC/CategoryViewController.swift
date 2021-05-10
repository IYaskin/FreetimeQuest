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
    
    func updateTitle(haveCategories: Bool) {
        guard haveCategories else {
            titleLabel.text = "★\(starsCount)"
            return
        }
        titleLabel.text = "\(Text.AddCategory) ★\(starsCount)"
    }
    
    func configureAdditionalQuestsStackView() {
        stackView.subviews.forEach({
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
        
        var haveCategories = false
        
        if !UserDefaultsManager.shared.isGoodQuestsSet {
            haveCategories = true
            addCategoryButtonToStackView(category: .good)
        }

        if !UserDefaultsManager.shared.isHobbyQuestsSet {
            haveCategories = true
            addCategoryButtonToStackView(category: .hobby)
        }
        
        
        if !UserDefaultsManager.shared.isSocialQuestsSet {
            haveCategories = true
            addCategoryButtonToStackView(category: .social)
        }
        
        if !UserDefaultsManager.shared.isCharismaQuestsSet {
            haveCategories = true
            addCategoryButtonToStackView(category: .charisma)
        }
        
        if !UserDefaultsManager.shared.isAdventureQuestsSet {
            haveCategories = true
            addCategoryButtonToStackView(category: .adventure)
        }

        if !haveCategories {
            updateTitle(haveCategories: false)
            addMyQuestsButtonToStackView()
            return
        }
        
        updateTitle(haveCategories: true)
    }
    
    func addCategoryButtonToStackView(category: Category) {
        let button = UIButton()
        
        button.tag = category.rawValue
        let title = NSLocalizedString(category.title, comment: "")
        button.setTitle("+ \(title) ★\(category.price)", for: .normal)
        button.setTitleColor(category.textColor, for: .normal)
        button.backgroundColor = category.cellColor
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 20
        stackView.addArrangedSubview(button)

    }
    
    func addMyQuestsButtonToStackView() {
        let button = UIButton()
        button.setTitle("\(Text.AddQuest) ★1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.addTarget(self, action: #selector(addMyQuest), for: .touchUpInside)
        button.layer.cornerRadius = 20
        stackView.addArrangedSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        guard let category = Category(rawValue: sender.tag) else {
            return
        }
        let title = NSLocalizedString(category.title, comment: "")
        showAlert(title: "\(Text.Add) \"\(title)\" \(Text._for) ★\(category.price)?",
                  okButtonTitle: Text.Ok,
                  okAction: { _ in
                    self.addCategory(category)
                  },
                  cancelButtonTitle: Text.Cancel)
    }
    
    @objc func addMyQuest() {
        if starsCount == 0 {
            showNotEnoughStarsAlert()
        } else {
            
            let alert = UIAlertController(title: Text.EnterQuestName, message: nil, preferredStyle: .alert)
            alert.view.tintColor = .black

            alert.addTextField { (textField) in
                textField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
                textField.font = .systemFont(ofSize: 20)
                textField.delegate = self
            }

            alert.addAction(UIAlertAction(title: Text.Ok, style: .default, handler: { [weak alert] (_) in
                guard let text = alert?.textFields?[0].text,
                      !text.isEmpty else {
                    self.showWrongNameAlert()
                    return
                }
                
                CoreDataManager.shared.saveMyQuest(title: text)
                self.updateTitle(haveCategories: false)
                self.mainVC?.updateHeader()
                self.showMyQuestAddedAlert()
            }))
            
            alert.addAction(UIAlertAction(title: Text.Cancel, style: .default, handler: nil))

            self.present(alert, animated: true, completion: nil)
        }
    }

    
    func addCategory(_ category: Category) {
        if starsCount < category.price {
            showNotEnoughStarsAlert()
        } else {
            
            switch category {
            case .good:
                GoodQuests.addQuests()
                UserDefaultsManager.shared.isGoodQuestsSet = true

            case .hobby:
                HobbyQuests.addQuests()
                UserDefaultsManager.shared.isHobbyQuestsSet = true

            case .social:
                SocialQuests.addQuests()
                UserDefaultsManager.shared.isSocialQuestsSet = true

            case .charisma:
                CharismaQuests.addQuests()
                UserDefaultsManager.shared.isCharismaQuestsSet = true

            case .adventure:
                AdventureQuests.addQuests()
                UserDefaultsManager.shared.isAdventureQuestsSet = true

            default:
                break
            }
            
            
            starsCount -= category.price
            configureAdditionalQuestsStackView()
            mainVC?.updateHeader()
            showQuestsAddedAlert()
        }

    }
    
    @IBAction func greyAreaTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}


extension CategoryViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 50
    }

}
