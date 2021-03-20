//
//  MemoryCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 20.03.2021.
//

import UIKit

class MemoryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    static let nibName = "MemoryCell"
    static let reuseID = "MemoryCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        imgView.image = nil
    }
    
    func configureUI() {
        selectionStyle = .none
        bgView.layer.cornerRadius = 20
    }
    
    func configure(title: String,
                   date: Date,
                   image: UIImage?) {
        titleLabel.text = title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateLabel.text = formatter.string(from: date)

        if let image = image {
            imgView.image = image
        } else {
            imgView.isHidden = true
        }

    }
    
}
