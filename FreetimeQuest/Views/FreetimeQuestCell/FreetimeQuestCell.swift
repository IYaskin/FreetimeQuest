//
//  FreetimeQuestCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 12.03.2021.
//

import UIKit

class FreetimeQuestCell: UITableViewCell {
        
    static let nibName = "FreetimeQuestCell"
    static let reuseID = "FreetimeQuestCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    
    func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func configure(category: Int) {
        
        if let category = Category(rawValue: category) {

        }

    }
    
}
