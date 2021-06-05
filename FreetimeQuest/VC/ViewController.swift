//
//  ViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 24.01.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var coreData = CoreDataManager.shared
    
    private lazy var fetchedResultsController: NSFetchedResultsController<QuestObject> = coreData.questFRC()
    
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
        UserDefaultsManager.shared.starsCount = 0
        UserDefaultsManager.shared.myQuestsCounter = 0

        FreetimeQuest.addHeader()

        GoOutQuests.addQuests()
        

        UserDefaultsManager.shared.isBaseQuestsSet = true
    }
    
    func configureUI() {

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: QuestCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: QuestCell.reuseID)
        tableView.register(UINib.init(nibName: FreetimeQuestCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: FreetimeQuestCell.reuseID)
        tableView.register(UINib.init(nibName: MyQuestCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: MyQuestCell.reuseID)
        
        tableView.register(UINib.init(nibName: CategoryHeader.nibName, bundle: nil), forHeaderFooterViewReuseIdentifier: CategoryHeader.reuseID)


        tableView.backgroundColor = .clear

        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Category" {
            if let nextViewController = segue.destination as? CategoryViewController {
                nextViewController.mainVC = self
            }
        }
    }
    
    func updateHeader() {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FreetimeQuestCell {
            cell.configure()
        }
    }
    
    func openWebOrAlert(indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        let quest = self.fetchedResultsController.object(at: indexPath)
        var urlString: String? = nil
        
        switch Int(quest.category) {
        case Category.goOut.rawValue:
            urlString = GoOutQuests.getURLString(id: Int(quest.id))
        case Category.good.rawValue:
            urlString = GoodQuests.getURLString(id: Int(quest.id))
        case Category.hobby.rawValue:
            urlString = HobbyQuests.getURLString(id: Int(quest.id))
        case Category.social.rawValue:
            urlString = SocialQuests.getURLString(id: Int(quest.id))
        case Category.charisma.rawValue:
            urlString = CharismaQuests.getURLString(id: Int(quest.id))
        case Category.adventure.rawValue:
            urlString = AdventureQuests.getURLString(id: Int(quest.id))
        default:
            break
        }

        if let url = urlString {
            
            guard Reachability.isConnectedToNetwork() else {
                showOkAlert(title: NSLocalizedString("CheckInternet", comment: ""))
                return
            }

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Web") as! WebViewController

            vc.navBarTitle = NSLocalizedString(quest.title, comment: "")
            vc.urlString = url

            navigationController?.pushViewController(vc, animated: true)

            return
        }
        
        var infoString: String? = nil
        
        switch Int(quest.category) {
        case Category.good.rawValue:
            infoString = GoodQuests.getInfoString(id: Int(quest.id))
        case Category.social.rawValue:
            infoString = SocialQuests.getInfoString(id: Int(quest.id))
        case Category.charisma.rawValue:
            infoString = CharismaQuests.getInfoString(id: Int(quest.id))
        case Category.adventure.rawValue:
            infoString = AdventureQuests.getInfoString(id: Int(quest.id))
        default:
            return
        }

        if let info = infoString {
            showOkAlert(title: info)
        }
        
        

    }
    
}

extension ViewController: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath,
                   for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let doneAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in
            let quest = self.fetchedResultsController.object(at: indexPath)
            self.showAlert(title: "\(Text.CompleteQuest)\n\"\(NSLocalizedString(quest.title, comment: ""))\" ?",
                           message: nil,
                           okButtonTitle: Text.Ok,
                           okAction: { _ in
                            self.coreData.doneQuest(quest)
                            Sound.playDoneQuest()
                           },
                           cancelButtonTitle: Text.Cancel) { _ in
            }
        }
        doneAction.backgroundColor = .white
        doneAction.image = UIImage(named: "check60")


        let deleteAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in
            let quest = self.fetchedResultsController.object(at: indexPath)
            self.showAlert(title: "\(Text.DeleteQuest)\n\"\(NSLocalizedString(quest.title, comment: ""))\" ?",
                           message: nil,
                           okButtonTitle: Text.Ok,
                           okAction: { _ in
                            self.coreData.deleteQuest(quest)
                            Sound.playDeleteQuest()
                           },
                           cancelButtonTitle: Text.Cancel) { _ in
            }
        }
        deleteAction.backgroundColor = .white
        deleteAction.image = UIImage(named: "close40")

        return [deleteAction, doneAction]
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = fetchedResultsController.sections else {
            return 0
        }
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            return 0
        }
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: FreetimeQuestCell.reuseID) as? FreetimeQuestCell {
                cell.configure()
                return cell
            }
            return UITableViewCell()
        }
        
        let quest = fetchedResultsController.object(at: indexPath)

        if quest.category == Category.myQuests.rawValue,
           let cell = tableView.dequeueReusableCell(withIdentifier: MyQuestCell.reuseID) as? MyQuestCell {
            cell.configure(title: quest.title)
            cell.delegate = self
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestCell.reuseID) as? QuestCell else {
            return UITableViewCell()
        }
        
        var urlString: String? = nil
        var infoString: String? = nil
        
        switch Int(quest.category) {
        case Category.goOut.rawValue:
            urlString = GoOutQuests.getURLString(id: Int(quest.id))
        case Category.good.rawValue:
            urlString = GoodQuests.getURLString(id: Int(quest.id))
            infoString = GoodQuests.getInfoString(id: Int(quest.id))
        case Category.hobby.rawValue:
            urlString = HobbyQuests.getURLString(id: Int(quest.id))
        case Category.social.rawValue:
            urlString = SocialQuests.getURLString(id: Int(quest.id))
            infoString = SocialQuests.getInfoString(id: Int(quest.id))
        case Category.charisma.rawValue:
            urlString = CharismaQuests.getURLString(id: Int(quest.id))
            infoString = CharismaQuests.getInfoString(id: Int(quest.id))
        case Category.adventure.rawValue:
            urlString = AdventureQuests.getURLString(id: Int(quest.id))
            infoString = AdventureQuests.getInfoString(id: Int(quest.id))
        default:
            break
        }

        let haveURL = urlString != nil
        let haveInfo = infoString != nil
            
        cell.configure(title: quest.title,
                       category: Int(quest.category),
                       stars: Int(quest.stars),
                       id: Int(quest.id),
                       haveURL: haveURL,
                       haveInfo: haveInfo)

        cell.delegate = self
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openWebOrAlert(indexPath: indexPath)
    }
    
    func tableView( _ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }

        let category = fetchedResultsController.object(at: IndexPath(row: 0, section: section)).category
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeader.reuseID) as! CategoryHeader
        let stars = fetchedResultsController.fetchedObjects?.filter{$0.category == category}.count ?? 0
        header.configureWith(category: Int(category),
                             stars: stars)
        return header
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }

        return 63
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == IndexPath(row: 0, section: 0) {
            return 145
        }
        return 118

    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }
}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange sectionInfo: NSFetchedResultsSectionInfo,
                    atSectionIndex sectionIndex: Int,
                    for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                if let header = tableView.headerView(forSection: indexPath.section) as? CategoryHeader,
                   let category = (anObject as? QuestObject)?.category,
                   let stars = fetchedResultsController.fetchedObjects?.filter({$0.category == category}).count {
                    header.updateStars(stars: stars)
                }
            }
            updateHeader()
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                if let header = tableView.headerView(forSection: indexPath.section) as? CategoryHeader,
                   let category = (anObject as? QuestObject)?.category,
                   let stars = fetchedResultsController.fetchedObjects?.filter({$0.category == category}).count {
                    header.updateStars(stars: stars)
                }
            }
            updateHeader()
        default:
            break
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
        
}
