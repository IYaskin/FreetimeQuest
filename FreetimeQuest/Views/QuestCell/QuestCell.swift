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
    
    static let nibName = "QuestCell"
    static let reuseID = "QuestCell"
    
    var quest: QuestObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imgView.image = nil
        quest = nil
    }
    
    func configureUI() {
//        selectionStyle = .none
//        backgroundColor = .clear
        bgView.layer.cornerRadius = 10
    }
    
    func configureWithQuest(_ quest: QuestObject) {
        self.quest = quest
        
        titleLabel.text = quest.title
    }
    
    
}
