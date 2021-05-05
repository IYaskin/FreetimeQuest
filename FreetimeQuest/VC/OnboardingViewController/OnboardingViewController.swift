//
//  OnboardingViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.05.2021.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        bgView.layer.cornerRadius = 20
        skipButton.setTitle("Пропустить", for: .normal)
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        UserDefaultsManager.shared.isOnboardingDone = true
        dismiss(animated: true, completion: nil)
    }
    
}
