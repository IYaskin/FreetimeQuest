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
    
    static let nibName = "QuestCell"
    static let reuseID = "QuestCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
//        imgView.image = nil
    }
    
    func configureUI() {
        selectionStyle = .none
        bgView.layer.cornerRadius = 10
    }
    
    func configure(title: String?,
                   category: Int) {
        titleLabel.text = title
        
        if let category = Category(rawValue: category) {
            titleLabel.textColor = category.textColor
            bgView.backgroundColor = category.bgColor
            cellView.backgroundColor = category.cellColor
        }

    }
    
}
