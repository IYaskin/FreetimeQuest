//
//  QuestCell.swift
//  FreetimeQuest
//
//  Created by Игорь Яськин on 14.10.2021.
//

import UIKit

class QuestCell: UICollectionViewCell {

    @IBOutlet private weak var imageBgView: UIView!
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet var imageOffsets: [NSLayoutConstraint]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ object: QuestObject, cellSide: CGFloat) {
        guard let category = Category(rawValue: Int(object.category)) else {
            return
        }
        imageBgView.backgroundColor = category.cellColor
        imageBgView.layer.borderWidth = 3
        imageBgView.layer.borderColor = object.isDone ? UIColor.myGreen.cgColor : UIColor.clear.cgColor
        imageBgView.dropShadow()
        
        let offset: CGFloat = 10
        let radius = (cellSide - offset) / 2
        imageBgView.layer.cornerRadius = radius
        
        if let image = UIImage(data: object.image) {
            imgView.image = image
            imgView.layer.cornerRadius = radius
            imageOffsets.forEach {
                $0.constant = 0
            }
        } else {
            imgView.image = Quests.getIcon(id: Int(object.id))
            imgView.layer.cornerRadius = 0
            imageOffsets.forEach {
                $0.constant = 20
            }
        }
        
    }
    
}
