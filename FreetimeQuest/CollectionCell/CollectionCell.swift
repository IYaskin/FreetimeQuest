//
//  CollectionCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.02.2021.
//
import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureUI() {

    }

    
}
