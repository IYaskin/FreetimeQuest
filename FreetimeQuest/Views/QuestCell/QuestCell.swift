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
    
    func configureCell(_ row: Int) {
        imageBgView.backgroundColor = UIColor(named: "Hobby.Cell")!
        imgView.image = UIImage(named: "massage")!
    }
    
    func configureCornerRadius(cellSide: CGFloat) {
        print("cellSide = \(cellSide)")
        let offset: CGFloat = 10
        let radius = (cellSide - offset) / 2
        print("radius = \(radius)")
        imageBgView.layer.cornerRadius = radius
    }
    
}
