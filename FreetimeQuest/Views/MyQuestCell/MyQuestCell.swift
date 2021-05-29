//
//  MyQuestCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 16.04.2021.
//

import Foundation

import UIKit

class MyQuestCell: SwipeTableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    static let nibName = "MyQuestCell"
    static let reuseID = "MyQuestCell"
    
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
    
    func configure(title: String?) {
        if let title = title {
            titleLabel.text = NSLocalizedString(title, comment: "")
        }
    }
    
}
