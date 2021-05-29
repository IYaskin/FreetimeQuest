//
//  MemoryCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 20.03.2021.
//

import UIKit

class MemoryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let nibName = "MemoryCell"
    static let reuseID = "MemoryCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //imgView.image = nil
    }
    
    func configureUI() {
        selectionStyle = .none
        bgView.layer.cornerRadius = 15
        imageContainerView.layer.cornerRadius = 15
        imgView.layer.cornerRadius = 0
        
        bgView.dropShadow()

    }
    
    func configure(title: String,
                   date: Date,
                   imageData: Data?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let date = formatter.string(from: date)
        dateLabel.text = date
        
        titleLabel.text = NSLocalizedString(title, comment: "")


        if let data = imageData,
           let image = UIImage(data: data) {
            imageContainerView.isHidden = false
            imgView.image = image
        } else {
            imageContainerView.isHidden = true
        }

    }
    
}
