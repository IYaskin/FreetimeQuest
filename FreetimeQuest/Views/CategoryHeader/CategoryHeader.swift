//
//  CategoryHeader.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 03.03.2021.
//

import UIKit

class CategoryHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    static let nibName = "CategoryHeader"
    static let reuseID = "CategoryHeader"

    public func configureWith(category: Int,
                              stars: Int) {
        if let category = Category(rawValue: category) {
            titleLabel.text = NSLocalizedString(category.title, comment: "")
            numberLabel.text = "\(stars)"
        }
    }
    
    public func updateStars(stars: Int) {
        numberLabel.text = "\(stars)"
    }
    
}
