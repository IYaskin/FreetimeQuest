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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneQuestsLabel: UILabel!
    @IBOutlet weak var progressBar: CustomProgressBar!
    @IBOutlet weak var starsLabel: UILabel!
    
    @IBOutlet weak var leftGreyView: UIView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightGreyView: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    
    func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        progressBar.backColor = UIColor(named: "grey")!
        progressBar.frontColor = UIColor(named: "violet")!
        
        leftGreyView.layer.cornerRadius = leftGreyView.bounds.width / 2
        leftImageView.layer.cornerRadius = leftImageView.bounds.width / 2
        leftImageView.layer.borderWidth = 1
        leftImageView.layer.borderColor = UIColor(named: "greyBorder")?.cgColor
        
        rightGreyView.layer.cornerRadius = rightGreyView.bounds.width / 2
        rightImageView.layer.cornerRadius = rightImageView.bounds.width / 2
        rightImageView.layer.borderWidth = 1
        rightImageView.layer.borderColor = UIColor(named: "greyBorder")?.cgColor

        
    }
    
    func configure() {
        let stars = UserDefaultsManager.shared.starsCount
        starsLabel.text = "\(stars)"
        
        let doneQuests = UserDefaultsManager.shared.doneQuestsCount
        let maxQuests = UserDefaultsManager.shared.allQuestsCount
        doneQuestsLabel.text = "\(doneQuests)\\\(maxQuests)"
        
        let progress: CGFloat = CGFloat(doneQuests) / CGFloat(maxQuests)
        progressBar.progress = progress
    }
    
}
