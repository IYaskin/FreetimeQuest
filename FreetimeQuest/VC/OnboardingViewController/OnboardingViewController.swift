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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    private var index = 0
    private let maxIndex = 2
    
    private let titles = [Text.CompleteQuests,
                          Text.AddQuests,
                          Text.CreateMemories]
    
    private let descriptions = [Text.CompleteQuestsDescription,
                                Text.AddQuestsDescription,
                                Text.CreateMemoriesDescription]
    
    private let images = [UIImage(named: "onboarding1")!,
                          UIImage(named: "onboarding2")!,
                          UIImage(named: "onboarding3")!]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        bgView.layer.cornerRadius = 20
        skipButton.setTitle(Text.Skip, for: .normal)
        nextButton.setTitle(Text.Next, for: .normal)
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.darkViolet.cgColor
        nextButton.layer.cornerRadius = 25
        configurePage()
    }
    
    func configurePage() {
        guard index >= 0 && index <= maxIndex else {
            return
        }
        titleLabel.text = titles[index]
        descriptionLabel.text = descriptions[index]
        imageView.image = images[index]
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        UserDefaultsManager.shared.isOnboardingDone = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard index != maxIndex else {
            UserDefaultsManager.shared.isOnboardingDone = true
            dismiss(animated: true, completion: nil)
            return
        }
        
        index += 1
        pageControl.currentPage = index
        configurePage()
        
        if index == maxIndex {
            nextButton.setTitle(Text.Start, for: .normal)
        }
    }
}
