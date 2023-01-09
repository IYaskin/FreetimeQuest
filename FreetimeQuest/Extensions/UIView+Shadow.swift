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
      layer.shadowOpacity = 0.2
      layer.shadowOffset = CGSize(width: 2, height: 2)
      layer.shadowRadius = 2
  }
}

