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
    @IBOutlet weak var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    
    func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        titleLabel.text = "Freetime Quest"
        
        progressView.tintColor = .systemTeal
        progressView.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.2)
        //progressView.layer.cornerRadius = 2
    }
    
    func configure() {
//        let stars = 15
//        starsLabel.text = "\(stars)☆"
        
        let doneQuests = UserDefaultsManager.shared.doneQuestsCount
        let maxQuests = UserDefaultsManager.shared.allQuestsCount
        doneQuestsLabel.text = "Выполнено \(doneQuests) из \(maxQuests)"
        
        let progress: Float = Float(doneQuests) / Float(maxQuests)
        progressView.setProgress(progress, animated: true)
    }
    
}
