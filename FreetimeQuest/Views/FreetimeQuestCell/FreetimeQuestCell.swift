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
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    
    func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        titleLabel.text = "Freetime Quest"
        
        progressBar.backColor = .black
        progressBar.frontColor = .red
    }
    
    func configure() {
        let stars = UserDefaultsManager.shared.starsCount
        starsLabel.text = "★\(stars)"
        
        let doneQuests = UserDefaultsManager.shared.doneQuestsCount
        let maxQuests = UserDefaultsManager.shared.allQuestsCount
        doneQuestsLabel.text = "Выполнено \(doneQuests) из \(maxQuests)"
        
        let progress: CGFloat = CGFloat(doneQuests) / CGFloat(maxQuests)
        progressBar.progress = progress
    }
    
}
