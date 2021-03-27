//
//  CustomProgressBar.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 21.03.2021.
//

import UIKit

class CustomProgressBar: UIView {
    
    @IBInspectable
    var progress: CGFloat = 0 {
        didSet {
            setProgress(animated: true)
        }
    }

    @IBInspectable
    var frontColor: UIColor = .red {
        didSet {
            frontView?.backgroundColor = frontColor
        }
    }
    
    @IBInspectable
    var backColor: UIColor = .gray {
        didSet {
            backgroundColor = backColor
        }
    }
    
    private var frontView: UIView?
    
    fileprivate func configureUI() {
        backgroundColor = backColor
        self.clipsToBounds = true
        self.layer.cornerRadius = bounds.height / 2
        
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
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setProgress(animated: false)
    }
}
