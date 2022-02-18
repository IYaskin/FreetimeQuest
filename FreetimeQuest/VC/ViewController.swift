//
//  ViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var leftCheckImageView: UIImageView!
    @IBOutlet weak var leftPlaceholderView: UIView!
    @IBOutlet weak var currentStarsLabel: UILabel!
    
    @IBOutlet weak var rightStarImageView: UIImageView!
    @IBOutlet weak var rightPlaceholderView: UIView!
    @IBOutlet weak var maxStarsLabel: UILabel!
    
    @IBOutlet weak var progressBar: CustomProgressBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    }
    
    override func viewDidLayoutSubviews() {
        leftCheckImageView.layer.cornerRadius = leftCheckImageView.bounds.height / 2
        rightStarImageView.layer.cornerRadius = rightStarImageView.bounds.height / 2
        leftPlaceholderView.layer.cornerRadius = leftPlaceholderView.bounds.height / 2
        rightPlaceholderView.layer.cornerRadius = leftPlaceholderView.bounds.height / 2
    }
    
    func showOnboardingIfNeeded() {
        if !UserDefaultsManager.shared.isOnboardingDone {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Onboarding") as! OnboardingViewController
            self.present(vc, animated: true)
        }
    }
    
    func firstLaunchCheck() {
        guard !UserDefaultsManager.shared.isBaseQuestsSet else {
            return
        }
        Quests.addQuests()
    }
    
    func configureUI() {
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
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        collectionView.reloadData()
    }
    
    //TODO: call after done/delete quest
    func updateUI() {
        let doneQuests = UserDefaultsManager.shared.doneQuestsCount
        let maxQuests = UserDefaultsManager.shared.allQuestsCount
        
        currentStarsLabel.text = "\(doneQuests)"
        maxStarsLabel.text = "\(maxQuests)"

        let progress: CGFloat = CGFloat(doneQuests) / CGFloat(maxQuests)
        progressBar.progress = progress
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestCell", for: indexPath) as! QuestCell
        let object = fetchedResultsController.fetchedObjects![indexPath.row]
        
        cell.configureCell(object)
        cell.configureCornerRadius(cellSide: cellSide)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSide, height: cellSide)
    }
}
