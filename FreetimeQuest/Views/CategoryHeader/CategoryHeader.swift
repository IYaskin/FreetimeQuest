//
//  CategoryHeader.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 03.03.2021.
//

import UIKit

class CategoryHeader: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        configureUI()
    }
    
    private func configureUI() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
    }

    public func configureWith(category: Int) {
        if let category = Category(rawValue: category) {
            titleLabel.text = NSLocalizedString(category.title, comment: "")
            titleLabel.textColor = category.headerTextColor
            headerView.backgroundColor = category.cellColor
        }
    }
    
}
