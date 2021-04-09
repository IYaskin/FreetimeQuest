//
//  UIView+Shadow.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 09.04.2021.
//

import UIKit

extension UIView {

  func dropShadow() {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: 3, height: 3)
      layer.shadowRadius = 3
  }
}

