//
//  QuestCell.swift
//  FreetimeQuest
//
//  Created by Игорь Яськин on 14.10.2021.
//

import UIKit

class QuestCell: UICollectionViewCell {

    @IBOutlet weak var imageBgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ object: QuestObject) {
        if let category = Category(rawValue: Int(object.category)) {
            imageBgView.backgroundColor = category.cellColor
            imgView.image = Quests.getIcon(id: Int(object.id))
            imageBgView.dropShadow()
        }
    }
    
    func configureCornerRadius(cellSide: CGFloat) {
        let offset: CGFloat = 10
        let radius = (cellSide - offset) / 2
        imageBgView.layer.cornerRadius = radius
    }
    
}
