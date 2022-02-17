//
//  ViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
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
        UserDefaultsManager.shared.allQuestsCount = 0
        UserDefaultsManager.shared.doneQuestsCount = 0

        Quests.addQuests()
        UserDefaultsManager.shared.isBaseQuestsSet = true
    }
    
    func configureUI() {
        collectionView.register(UINib(nibName: "QuestCell", bundle: nil),
                                forCellWithReuseIdentifier: "QuestCell")
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        collectionView.reloadData()

    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        52
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
