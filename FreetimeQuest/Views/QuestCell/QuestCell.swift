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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imgView.image = nil
    }
    
    func configureUI() {
        bgView.layer.cornerRadius = 10
    }
    
    func configure(title: String?) {
        titleLabel.text = title
    }
    
}
