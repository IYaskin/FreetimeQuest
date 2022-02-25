//
//  OnboardingViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.05.2021.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet private weak var bgView: UIView!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        bgView.layer.cornerRadius = 20
        nextButton.setTitle(Text.Start, for: .normal)
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.darkViolet.cgColor
        nextButton.layer.cornerRadius = 25
        titleLabel.text = Text.Hello
        descriptionLabel.text = Text.OnboardingText
    }

    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        UserDefaultsManager.shared.isOnboardingDone = true
        dismiss(animated: true, completion: nil)
    }
    
}
