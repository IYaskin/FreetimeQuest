//
//  CategoryView.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 18.02.2021.
//

import UIKit
import CoreData

class CategoryView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    private var coreData = CoreDataManager.shared
    
    private var fetchedResultsController: NSFetchedResultsController<QuestObject>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let nib = UINib(nibName: String(describing: type(of: self)),
                        bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: QuestCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: QuestCell.reuseID)
        
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        configureUI()
    }
    
    private func configureUI() {
        contentView.layer.cornerRadius = 20
        tableViewHeightConstraint.constant = 0
        tableView.backgroundColor = .clear
    }
    
    public func configureWith(category: Category) {
        self.fetchedResultsController = CoreDataManager.shared.fetchedResultsController(category)
        self.fetchedResultsController?.delegate = self
        do {
            try fetchedResultsController?.performFetch()
        } catch {
            print(error)
        }

        contentView.backgroundColor = category.bgColor
        titleLabel.text = category.title
        descriptionLabel.text = category.description
        
        updateTableViewHeight()
    }
    
    private func updateTableViewHeight() {
        if let cellsCount = fetchedResultsController?.fetchedObjects?.count {
            print(cellsCount)
            self.tableViewHeightConstraint.constant = 90 * CGFloat(cellsCount)
        }
    }
    
}

extension CategoryView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let frc = fetchedResultsController,
              let sections = frc.sections else {
            return 0
        }
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let frc = fetchedResultsController,
              let sections = frc.sections else {
            return 0
        }
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let frc = fetchedResultsController else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestCell.reuseID) as? QuestCell else {
            return UITableViewCell()
        }
        
        let quest = frc.object(at: indexPath)
        cell.configure(title: quest.title)

        return cell
    }
    
}

extension CategoryView: UITableViewDelegate {
        
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let doneAction = UIContextualAction(style: .destructive, title: "Done") { (action, view, handler) in
            print("Done Action Tapped")
        }
        doneAction.backgroundColor = .green


        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in

            if let quest = self.fetchedResultsController?.object(at: indexPath) {
                CoreDataManager.shared.deleteQuest(quest)
            }

            print("Delete Action Tapped")
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, doneAction])

        configuration.performsFirstActionWithFullSwipe = false
        return configuration

    }
}

extension CategoryView: NSFetchedResultsControllerDelegate {
    
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
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        default:
            break
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
        
}
