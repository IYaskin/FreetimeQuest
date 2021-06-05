//
//  MemoryViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 14.03.2021.
//

import UIKit
import CoreData

class MemoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var loaderLabel: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    private var coreData = CoreDataManager.shared
    
    private lazy var fetchedResultsController: NSFetchedResultsController<MemoryObject> = coreData.memoryFRC()

    private let imagePlaceholder = UIImage(named: "GIF_1")!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.title = Text.Memories
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: MemoryCell.nibName, bundle: nil),
                                  forCellReuseIdentifier: MemoryCell.reuseID)

        tableView.backgroundColor = .clear

        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }

    }
    
    public func updateCell(image: UIImage?, indexPath: IndexPath) {
        let quest = fetchedResultsController.object(at: indexPath)
        quest.image = image?.jpegData(compressionQuality: 0.5)
        CoreDataManager.shared.saveContext()
    }
    
    public func deleteMemory(indexPath: IndexPath) {
        let memory = fetchedResultsController.object(at: indexPath)
        CoreDataManager.shared.deleteMemory(memory)
    }
    
    public func openSheet(haveImage: Bool, indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Sheet") as! SheetViewController
        vc.mainVC = self
        vc.haveImage = haveImage
        vc.indexPath = indexPath

        self.present(vc, animated: true)
    }
    
    @IBAction func createGIFBarButtonTapped(_ sender: UIBarButtonItem) {
        showAlert(title: Text.CreateGIF, okButtonTitle: Text.Ok, okAction: { [weak self] _ in
            self?.showLoader()
            self?.createGIF()
        },
        cancelButtonTitle: Text.Cancel)
    }
    
    private func createGIF() {
        var images: [UIImage] = [imagePlaceholder]
        var imagesCount = 0
        fetchedResultsController.fetchedObjects?.forEach({ (memory) in
            if let data = memory.image,
               let image = UIImage(data: data) {
                images.append(image)
                imagesCount += 1
            }
        })
        
        guard imagesCount > 1 else {
            hideLoader()
            showOkAlert(title: Text.AtLeastTwoImage)
            return
        }
        loaderLabel.text = "\(Text.CreatingGIFFrom) \(imagesCount) \(Text.photo)"

        GIF.createGif(from: images) { success in
            DispatchQueue.main.async { [weak self] in
                if success {
                    self?.hideLoader()
                    self?.showOkAlert(title: Text.GIFCreated)
                } else {
                    self?.hideLoader()
                    self?.showOkAlert(title: Text.GIFNotCreated)
                }
            }
        }
    }
    
    private func showLoader() {
        loaderLabel.text = "\(Text.CreatingGIFFrom) _ \(Text.photo)"
        loaderView.isHidden = false
        loader.startAnimating()
    }
    
    private func hideLoader() {
        loaderLabel.text = "\(Text.CreatingGIFFrom) _ \(Text.photo)"
        loader.stopAnimating()
        loaderView.isHidden = true
    }

}


extension MemoryViewController: UITableViewDataSource {
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoryCell.reuseID) as? MemoryCell else {
            return UITableViewCell()
        }

        let memory = fetchedResultsController.object(at: indexPath)

        cell.configure(title: memory.title,
                       date: memory.date,
                       imageData: memory.image)
        return cell
    }
    
}

extension MemoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memory = fetchedResultsController.object(at: indexPath)
        let haveImage = memory.image != nil

        openSheet(haveImage: haveImage, indexPath: indexPath)
    }
    
}

extension MemoryViewController: NSFetchedResultsControllerDelegate {
    
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
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                let quest = fetchedResultsController.object(at: indexPath)
                guard let cell = tableView.cellForRow(at: indexPath) as? MemoryCell else { break }
                
                cell.configure(title: quest.title,
                               date: quest.date,
                               imageData: quest.image)
            }

        default:
            break
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
        
}
