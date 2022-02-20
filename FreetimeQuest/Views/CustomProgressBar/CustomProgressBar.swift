//
//  CustomProgressBar.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 21.03.2021.
//

import UIKit

class CustomProgressBar: UIView {
    
    var progress: CGFloat = 0 {
        didSet {
            setProgress(animated: true)
        }
    }

    private var frontView: UIView?

    private var frontColor: UIColor = .myGreen
    private var backColor: UIColor = .black.withAlphaComponent(0.2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setProgress(animated: false)
    }

    
    private func configureUI() {
        backgroundColor = backColor
        self.clipsToBounds = true
        self.layer.cornerRadius = bounds.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        
        addFrontView()
    }
    
    private func addFrontView() {
        let view = UIView(frame: bounds.inset(by: UIEdgeInsets(top: 0,
                                                               left: 0,
                                                               bottom: 0,
                                                               right: bounds.width - bounds.width * progress)))
        view.backgroundColor = frontColor
        view.clipsToBounds = true
        view.layer.cornerRadius = bounds.height / 2

        addSubview(view)
        frontView = view
    }
    
        
        
    private func setProgress(animated: Bool) {
        let newWidth = max(bounds.width * progress, 0)
        let setting = {
            self.frontView?.frame.size.width = newWidth
        }
        if animated {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut) {
               setting()
            }
        } else {
            setting()
        }
    }
    
}
