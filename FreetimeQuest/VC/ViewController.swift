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

        configureUI()
    }
    
    func configureUI() {
        addQuests()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: QuestCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: QuestCell.reuseID)
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
        if let category = Int(fetchedResultsController.sectionIndexTitles[section]) {
            let header = CategoryHeader()
            header.configureWith(category: category)
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
            
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let doneAction = UIContextualAction(style: .destructive, title: "Готово") { (action, view, handler) in
            let quest = self.fetchedResultsController.object(at: indexPath)
            let title = quest.title != nil ? "\"\(quest.title ?? "")\"" : ""
            self.showAlert(title: "Выполнить задание\n\(title) ?",
                           message: nil,
                           okButtonTitle: "Готово",
                           okAction: { _ in
                            self.coreData.deleteQuest(quest)
                           },
                           cancelButtonTitle: "Отмена") { _ in
                handler(true)
            }
        }
        doneAction.backgroundColor = .systemYellow
        doneAction.image = UIImage(named: "done")


        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (action, view, handler) in
            let quest = self.fetchedResultsController.object(at: indexPath)
            let title = quest.title != nil ? "\"\(quest.title ?? "")\"" : ""
            
            self.showAlert(title: "Удалить задание\n\(title) ?",
                           message: nil,
                           okButtonTitle: "Удалить",
                           okAction: { _ in
                            self.coreData.deleteQuest(quest)
                           },
                           cancelButtonTitle: "Отмена") { _ in
                handler(true)
            }
        }
        
        deleteAction.backgroundColor = .systemYellow
        deleteAction.image = UIImage(named: "delete")
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
        default:
            break
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
        
}
