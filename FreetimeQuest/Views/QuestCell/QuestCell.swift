//
//  QuestCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 20.02.2021.
//

import UIKit

class QuestCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var infoImageView: UIImageView!
    
    @IBOutlet weak var starsLabel: UILabel!
    
    static let nibName = "QuestCell"
    static let reuseID = "QuestCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
        
    func configureUI() {
        selectionStyle = .none
        bgView.backgroundColor = .clear
        cellView.layer.cornerRadius = 15
        cellView.dropShadow()
    }
    
    func configureStars(stars: Int) {
        starsLabel.text = ""
        var text = ""
        for _ in 1...stars {
            text += "★"
        }
        starsLabel.text = text

    }
    
    func configure(title: String?,
                   category: Int,
                   stars: Int,
                   id: Int,
                   haveURL: Bool,
                   haveInfo: Bool) {
        if let title = title {
            titleLabel.text = NSLocalizedString(title, comment: "")
        }
        if haveInfo {
            infoImageView.isHidden = false
            infoImageView.image = UIImage(named: "info")
        } else {
            infoImageView.isHidden = true
        }
        configureStars(stars: stars)
        
        if let category = Category(rawValue: category) {
            titleLabel.textColor = category.textColor
            cellView.backgroundColor = category.cellColor
            
            starsLabel.textColor = category.textColor
            
            switch category {
            case .goOut:
                imgView.image = GoOutQuests.getIcon(id: id)
            case .good:
                imgView.image = GoodQuests.getIcon(id: id)
            case .hobby:
                imgView.image = HobbyQuests.getIcon(id: id)
            case .social:
                imgView.image = SocialQuests.getIcon(id: id)
            case .charisma:
                imgView.image = CharismaQuests.getIcon(id: id)
            case .adventure:
                imgView.image = AdventureQuests.getIcon(id: id)
            default:
                imgView.image = nil
            }
        }

    }
    
}
