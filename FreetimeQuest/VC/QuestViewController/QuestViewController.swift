//
//  QuestViewController.swift
//  FreetimeQuest
//
//  Created by Игорь Яськин on 20.02.2022.
//

import UIKit

class QuestViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var questTitle: String?
    var category: Category?

    override func viewDidLoad() {
        super.viewDidLoad()
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector (bgTapped))
        bgView.addGestureRecognizer(dismissTap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let title = questTitle {
            titleLabel.text = NSLocalizedString(title, comment: "")
        }
        if let category = category {
            contentView.backgroundColor = category.cellColor
            categoryLabel.text = NSLocalizedString(category.title, comment: "")
            categoryLabel.textColor = category.starColor
        }
    }
    
    override func viewDidLayoutSubviews() {
        contentView.layer.cornerRadius = 20
    }
    
    @objc func bgTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func photoButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
}
