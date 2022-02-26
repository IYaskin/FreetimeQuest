//
//  QuestViewController.swift
//  FreetimeQuest
//
//  Created by Игорь Яськин on 20.02.2022.
//

import UIKit

class QuestViewController: UIViewController {

    @IBOutlet private weak var bgView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var photoButton: UIButton!
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    var quest: QuestObject?
    var updateHandler: ((Animation?)->())?
    
    private let imagePicker = ImagePickerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector (bgTapped))
        bgView.addGestureRecognizer(dismissTap)
        imagePicker.delegate = self
        imagePicker.presentingViewController = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let quest = quest else {
            return
        }

        titleLabel.text = NSLocalizedString(quest.title, comment: "")
        
        if quest.isDone {
            doneButton.setImage(UIImage.init(systemName: "arrow.counterclockwise"), for: .normal)
        } else {
            doneButton.setImage(UIImage.init(systemName: "checkmark"), for: .normal)
        }
        
        if let category = Category(rawValue: Int(quest.category)) {
            contentView.backgroundColor = category.cellColor
            categoryLabel.text = NSLocalizedString(category.title, comment: "")
            categoryLabel.textColor = category.starColor
        }
    }
    
    override func viewDidLayoutSubviews() {
        contentView.layer.cornerRadius = 20
    }
    
    @objc private func bgTapped() {
        dismiss(animated: true)
    }
    
    @IBAction private func shareButtonTapped(_ sender: UIButton) {
        guard let title = quest?.title else {
            return
        }
        let text = Text.ShareTextStart + "\"" + NSLocalizedString(title, comment: "") + "\"" + Text.ShareTextEnd
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        activityVC.excludedActivityTypes = [.message, .mail]
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction private func photoButtonTapped(_ sender: UIButton) {
        guard let quest = quest else {
            return
        }

        let alertVC = UIAlertController(title: Text.SetPhoto, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: Text.Cancel, style: .cancel)
        
        let deleteAction = UIAlertAction(title: Text.DeletePhoto, style: .destructive) { [weak self] _ in
            CoreDataManager.shared.setQuestImage(quest, image: Data())
            self?.dismiss(animated: false) { [weak self] in
                self?.updateHandler?(nil)
            }
        }
        
        let galleryAction = UIAlertAction(title: Text.AddGallery, style: .default) { [weak self] _ in
            self?.imagePicker.presentImagePicker(.photoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: Text.AddCamera, style: .default) { [weak self] _ in
            self?.imagePicker.presentImagePicker(.camera)
        }

        alertVC.addAction(cameraAction)
        alertVC.addAction(galleryAction)
        if UIImage(data: quest.image) != nil {
            alertVC.addAction(deleteAction)
        }
        alertVC.addAction(cancelAction)

        present(alertVC, animated: true)
    }
    
    @IBAction private func deleteButtonTapped(_ sender: UIButton) {
        guard let quest = quest else {
            return
        }

        showAlert(title: Text.DeleteQuest,
                  okButtonTitle: Text.Ok, okAction: { [weak self] _ in
            let questIsDone = quest.isDone
            CoreDataManager.shared.deleteQuest(quest)
            Sound.playBadMusic()
            self?.dismiss(animated: false) { [weak self] in
                self?.updateHandler?(questIsDone ? .deleteDoneQuest : .deleteUndoneQuest)
            }

        }, cancelButtonTitle: Text.Cancel)

    }
    
    @IBAction private func doneButtonTapped(_ sender: UIButton) {
        guard let quest = quest else {
            return
        }
        let questIsDone = !quest.isDone
        CoreDataManager.shared.doneQuest(quest, isDone: questIsDone)
        
        if questIsDone {
            let randomInt = Int.random(in: 1..<4)
            print(randomInt)
            Sound.playGoodMusic(id: randomInt)
        } else {
            Sound.playBadMusic()
        }
        
        dismiss(animated: true) { [weak self] in
            self?.updateHandler?(questIsDone ? .doneQuest : .undoneQuest)
        }
    }
    
}

extension QuestViewController: ImagePickerServiceDelegate {
    
    func imagePickerService(_ service: ImagePickerService,
                            finishWith image: UIImage) {
        guard let quest = quest else {
            return
        }

        CoreDataManager.shared.setQuestImage(quest, image: image.pngData() ?? Data())
        dismiss(animated: false) { [weak self] in
            self?.updateHandler?(nil)
        }
    }
    
    func imagePickerService(_ service: ImagePickerService,
                            finishWith error: String) {
        showOkAlert(title: "Не удалось получить фото :(", okButtonTitle: "Ок")
    }
}
