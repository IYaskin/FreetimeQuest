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
    
    @IBOutlet weak var firstStarLabel: UILabel!
    @IBOutlet weak var secondStarLabel: UILabel!
    @IBOutlet weak var thirdStarLabel: UILabel!
    @IBOutlet weak var infoImageView: UIImageView!
    
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

        if stars == 1 {
            firstStarLabel.isHidden = false
            secondStarLabel.isHidden = true
            thirdStarLabel.isHidden = true

            firstStarLabel.font = .systemFont(ofSize: 24)
            
        } else if stars == 2 {
            firstStarLabel.isHidden = false
            secondStarLabel.isHidden = false
            thirdStarLabel.isHidden = true

            firstStarLabel.font = .systemFont(ofSize: 20)
            secondStarLabel.font = .systemFont(ofSize: 20)
        } else if stars == 3 {
            firstStarLabel.isHidden = false
            secondStarLabel.isHidden = false
            thirdStarLabel.isHidden = false
            
            firstStarLabel.font = .systemFont(ofSize: 17)
            secondStarLabel.font = .systemFont(ofSize: 17)
            thirdStarLabel.font = .systemFont(ofSize: 17)
            
        } else {
            firstStarLabel.isHidden = true
            secondStarLabel.isHidden = true
            thirdStarLabel.isHidden = true
        }
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
        if haveURL {
            infoImageView.isHidden = false
            infoImageView.image = UIImage(named: "internet")
        } else if haveInfo {
            infoImageView.isHidden = false
            infoImageView.image = UIImage(named: "info")
        } else {
            infoImageView.isHidden = true
        }
        configureStars(stars: stars)
        
        if let category = Category(rawValue: category) {
            titleLabel.textColor = category.textColor
            cellView.backgroundColor = category.cellColor
            
            firstStarLabel.textColor = category.textColor
            secondStarLabel.textColor = category.textColor
            thirdStarLabel.textColor = category.textColor
            
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
