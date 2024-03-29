//
//  ViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var leftCheckImageView: UIImageView!
    @IBOutlet private weak var leftPlaceholderView: UIView!
    @IBOutlet private weak var currentStarsLabel: UILabel!
    
    @IBOutlet private weak var rightStarImageView: UIImageView!
    @IBOutlet private weak var rightPlaceholderView: UIView!
    @IBOutlet private weak var maxStarsLabel: UILabel!
    
    @IBOutlet private weak var progressBar: CustomProgressBar!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var coreData = CoreDataManager.shared
    
    private lazy var fetchedResultsController: NSFetchedResultsController<QuestObject> = coreData.questFRC()
    
    private var cellSide: CGFloat {
        (view.bounds.width - 40) / 4
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstLaunchCheck()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showOnboardingIfNeeded()
        updateUI()
    }
    
    override func viewDidLayoutSubviews() {
        leftCheckImageView.layer.cornerRadius = leftCheckImageView.bounds.height / 2
        rightStarImageView.layer.cornerRadius = rightStarImageView.bounds.height / 2
        leftPlaceholderView.layer.cornerRadius = leftPlaceholderView.bounds.height / 2
        rightPlaceholderView.layer.cornerRadius = leftPlaceholderView.bounds.height / 2
    }
    
    private func showOnboardingIfNeeded() {
        if !UserDefaultsManager.shared.isOnboardingDone {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Onboarding") as! OnboardingViewController
            self.present(vc, animated: true)
        }
    }
    
    private func firstLaunchCheck() {
        guard !UserDefaultsManager.shared.isBaseQuestsSet else {
            return
        }
        Quests.addQuests()
    }
    
    private func configureUI() {
        leftCheckImageView.layer.borderWidth = 1
        leftCheckImageView.layer.borderColor = UIColor.violet.cgColor
        leftPlaceholderView.layer.borderWidth = 1
        leftPlaceholderView.layer.borderColor = UIColor.gray.cgColor
        
        rightStarImageView.layer.borderWidth = 1
        rightStarImageView.layer.borderColor = UIColor.violet.cgColor
        rightPlaceholderView.layer.borderWidth = 1
        rightPlaceholderView.layer.borderColor = UIColor.gray.cgColor
        
        currentStarsLabel.text = "\(UserDefaultsManager.shared.doneQuestsCount)"
        maxStarsLabel.text = "\(UserDefaultsManager.shared.allQuestsCount)"
        
        collectionView.register(UINib(nibName: "QuestCell", bundle: nil),
                                forCellWithReuseIdentifier: "QuestCell")
    }
    
    private func updateUI(animation: Animation? = nil) {
        let doneQuests = UserDefaultsManager.shared.doneQuestsCount
        let maxQuests = UserDefaultsManager.shared.allQuestsCount
        
        currentStarsLabel.text = "\(doneQuests)"
        maxStarsLabel.text = "\(maxQuests)"

        let progress: CGFloat = CGFloat(doneQuests) / CGFloat(maxQuests)
        progressBar.progress = progress
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        collectionView.reloadData()
        
        
        guard let animation = animation else {
            return
        }
        animate(animation)
    }
    
    private func animate(_ animation: Animation) {
        UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve) {[weak self] in
            switch animation {
            case .doneQuest:
                self?.leftPlaceholderView.backgroundColor = .green
            case .undoneQuest:
                self?.leftPlaceholderView.backgroundColor = .red
            case .deleteDoneQuest:
                self?.leftPlaceholderView.backgroundColor = .red
                self?.rightPlaceholderView.backgroundColor = .red
            case .deleteUndoneQuest:
                self?.rightPlaceholderView.backgroundColor = .red
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve) {[weak self] in
                self?.leftPlaceholderView.backgroundColor = .white
                self?.rightPlaceholderView.backgroundColor = .white
            }
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestCell", for: indexPath) as! QuestCell
        let object = fetchedResultsController.fetchedObjects![indexPath.row]
        
        cell.configureCell(object, cellSide: cellSide)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Quest") as! QuestViewController
        
        let quest = fetchedResultsController.object(at: indexPath)
        vc.quest = quest
        
        vc.updateHandler = { [weak self] animation in
            self?.updateUI(animation: animation)
        }

        self.present(vc, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSide, height: cellSide)
    }
}
