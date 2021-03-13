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
    
    func firstLaunchCheck() {
        print("isBaseQuestsSet = \(UserDefaultsManager.shared.isBaseQuestsSet)")
        guard !UserDefaultsManager.shared.isBaseQuestsSet else {
            return
        }
        UserDefaultsManager.shared.allQuestsCount = 0
        UserDefaultsManager.shared.doneQuestsCount = 0
        
        FreetimeQuest.addHeader()

        GoOutQuests.addQuests()

        BrainQuests.addQuests()

        GoodQuests.addQuests()

        SocialQuests.addQuests()

        AdventureQuests.addQuests()

        UserDefaultsManager.shared.isBaseQuestsSet = true
    }
    
    func configureUI() {        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: QuestCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: QuestCell.reuseID)
        tableView.register(UINib.init(nibName: FreetimeQuestCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: FreetimeQuestCell.reuseID)

        tableView.backgroundColor = .clear

        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }

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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestCell.reuseID) as? QuestCell else {
            return UITableViewCell()
        }
        
        let quest = fetchedResultsController.object(at: indexPath)
        cell.configure(title: quest.title,
                       category: Int(quest.category))

        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView( _ tableView: UITableView,
                            viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }

        if let category = Int(fetchedResultsController.sectionIndexTitles[section]) {
            let header = CategoryHeader()
            header.configureWith(category: category)
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }

        return 60
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }
            
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let doneAction = UIContextualAction(style: .destructive, title: nil) { (action, view, handler) in
            let quest = self.fetchedResultsController.object(at: indexPath)
            let title = quest.title != nil ? "\"\(quest.title ?? "")\"" : ""
            self.showAlert(title: "Выполнить задание\n\(title) ?",
                           message: nil,
                           okButtonTitle: "Готово",
                           okAction: { _ in
                            self.coreData.doneQuest(quest)
                            handler(true)
                           },
                           cancelButtonTitle: "Отмена") { _ in
                handler(false)
            }
        }
        doneAction.backgroundColor = .systemYellow
        
        let doneImage = UIImage(named: "check")!
        let doneResizedImage = doneImage.resizeImageWith(newSize: CGSize(width: 32,
                                                                         height: 32))
        let doneCGImage = doneResizedImage.cgImage
        if let cgImage =  doneCGImage {
            doneAction.image = ImageWithoutRender(cgImage: cgImage, scale: 1, orientation: .up)
        }

        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, view, handler) in
            let quest = self.fetchedResultsController.object(at: indexPath)
            let title = quest.title != nil ? "\"\(quest.title ?? "")\"" : ""
            
            self.showAlert(title: "Удалить задание\n\(title) ?",
                           message: nil,
                           okButtonTitle: "Удалить",
                           okAction: { _ in
                            self.coreData.deleteQuest(quest)
                            handler(true)
                           },
                           cancelButtonTitle: "Отмена") { _ in
                handler(false)
            }
        }
        
        deleteAction.backgroundColor = .systemYellow

        let deleteImage = UIImage(named: "close")!
        
        let deleteResizedImage = deleteImage.resizeImageWith(newSize: CGSize(width: 23,
                                                                         height: 23))
        let deleteCGImage = deleteResizedImage.cgImage
        if let cgImage =  deleteCGImage {
            deleteAction.image = ImageWithoutRender(cgImage: cgImage, scale: 1, orientation: .up)
        }

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, doneAction])

        configuration.performsFirstActionWithFullSwipe = false
        return configuration

    }
}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            if let indexPath = indexPath {
                if tableView.numberOfRows(inSection: indexPath.section) == 1 {
                    tableView.deleteSections([indexPath.section], with: .automatic)
                } else {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
            if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FreetimeQuestCell {
                cell.configure()
            }
        default:
            break
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
        
}
