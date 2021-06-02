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
    
    private let ruImages = [UIImage(named: "onboarding_ru_1")!,
                            UIImage(named: "onboarding_ru_2")!,
                            UIImage(named: "onboarding_ru_3")!]
    
    private let enImages = [UIImage(named: "onboarding_en_1")!,
                            UIImage(named: "onboarding_en_2")!,
                            UIImage(named: "onboarding_en_3")!]

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
        imageView.image = Text.isRussian ? ruImages[index] : enImages[index]
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        completeOnboarding()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard index != maxIndex else {
            completeOnboarding()
            return
        }
        
        index += 1
        pageControl.currentPage = index
        configurePage()
        
        if index == maxIndex {
            nextButton.setTitle(Text.Start, for: .normal)
        }
    }
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        // previous
        guard index > 0 else {
            return
        }
        
        if index == maxIndex {
            nextButton.setTitle(Text.Next, for: .normal)
        }

        index -= 1
        pageControl.currentPage = index
        configurePage()
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        // next
        guard index != maxIndex else {
            return
        }
        
        index += 1
        pageControl.currentPage = index
        configurePage()
        
        if index == maxIndex {
            nextButton.setTitle(Text.Start, for: .normal)
        }
    }
    
    private func completeOnboarding() {
        UserDefaultsManager.shared.isOnboardingDone = true
        dismiss(animated: true, completion: nil)
    }
    
}
