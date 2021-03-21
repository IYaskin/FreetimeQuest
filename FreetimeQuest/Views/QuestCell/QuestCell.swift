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
    
    static let nibName = "QuestCell"
    static let reuseID = "QuestCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
        
    func configureUI() {
        selectionStyle = .none
        bgView.backgroundColor = .clear
        cellView.layer.cornerRadius = 10
    }
    
    func configureStars(stars: Int) {
        let fullStar = "★"
        let emptyStar = "☆"
        
        if stars == 1 {
            firstStarLabel.text = fullStar
            secondStarLabel.text = emptyStar
            thirdStarLabel.text = emptyStar
        } else if stars == 2 {
            firstStarLabel.text = fullStar
            secondStarLabel.text = fullStar
            thirdStarLabel.text = emptyStar
        } else if stars == 3 {
            firstStarLabel.text = fullStar
            secondStarLabel.text = fullStar
            thirdStarLabel.text = fullStar
        } else {
            firstStarLabel.text = emptyStar
            secondStarLabel.text = emptyStar
            thirdStarLabel.text = emptyStar
        }
    }
    
    func configure(title: String?,
                   category: Int,
                   stars: Int) {
        titleLabel.text = title
        configureStars(stars: stars)
        
        if let category = Category(rawValue: category) {
            titleLabel.textColor = category.textColor
            cellView.backgroundColor = category.cellColor
            
            firstStarLabel.textColor = category.textColor
            secondStarLabel.textColor = category.textColor
            thirdStarLabel.textColor = category.textColor

        }

    }
    
}
