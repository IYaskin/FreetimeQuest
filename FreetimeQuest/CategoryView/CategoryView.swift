//
//  CategoryView.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 18.02.2021.
//

import UIKit

class CategoryView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    private var coreData = CoreDataManager.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let nib = UINib(nibName: String(describing: type(of: self)),
                        bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        configureUI()
    }
    
    private func configureUI() {
        contentView.layer.cornerRadius = 20
        tableViewHeightConstraint.constant = 200
    }
    
    public func configureWith(category: Category) {
        contentView.backgroundColor = category.bgColor
        titleLabel.text = category.title
        descriptionLabel.text = category.description
        
//        switch category {
//        case .good:
//            titleLabel.text = "Добро"
//        case .goOut:
//            titleLabel.text = "Выход в свет"
//            descriptionLabel.text = "А че дома делать?"
//        case .social:
//            titleLabel.text = "Социализация"
//        case .brain:
//            titleLabel.text = "Мозг"
//        case .adventure:
//            titleLabel.text = "Приключения"
//        }
        
        
    }
}
