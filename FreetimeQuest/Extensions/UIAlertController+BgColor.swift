//
//  UIAlertController+BgColor.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 09.04.2021.
//

import UIKit

extension UIAlertController{
    
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first,
           let groupView = bgView.subviews.first,
           let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }
    
}
