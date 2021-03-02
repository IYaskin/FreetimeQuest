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
        cell.configure(title: quest.title)

        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = Int(fetchedResultsController.sectionIndexTitles[section]),
           let category = Category(rawValue: section) {
            return category.description
        }
        return nil
    }
            
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let doneAction = UIContextualAction(style: .normal, title: "Done") { (action, view, handler) in
            print("Done Action Tapped")
        }
        doneAction.backgroundColor = .green


        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in

            let quest = self.fetchedResultsController.object(at: indexPath)
            self.coreData.deleteQuest(quest)

            print("Delete Action Tapped")
        }
        deleteAction.backgroundColor = .red
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
        case .insert:
            print("insert")
            if let indexPath = indexPath {
            tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            print("delete")
            if let indexPath = indexPath {
                if tableView.numberOfRows(inSection: indexPath.section) == 1 {
                    tableView.deleteSections([indexPath.section], with: .automatic)
                } else {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
        case .update:
            print("update")
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! QuestCell
                cell.configure(title: "fuuuck")
            }
        case .move:
            print("move")
            if let indexPath = indexPath,
               let newIndexPath = newIndexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        default:
            break
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
        
}
