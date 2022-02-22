//
//  QuestViewController.swift
//  FreetimeQuest
//
//  Created by Игорь Яськин on 20.02.2022.
//

import UIKit

class QuestViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var quest: QuestObject?
    var updateHandler: (()->())?
    
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
    
    @objc func bgTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func photoButtonTapped(_ sender: UIButton) {
        guard let quest = quest else {
            return
        }

        let alertVC = UIAlertController(title: Text.SetPhoto, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: Text.Cancel, style: .cancel)
        
        let deleteAction = UIAlertAction(title: Text.DeletePhoto, style: .destructive) { [weak self] _ in
            CoreDataManager.shared.setQuestImage(quest, image: Data())
            self?.dismiss(animated: false) { [weak self] in
                self?.updateHandler?()
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
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        guard let quest = quest else {
            return
        }

        showAlert(title: Text.DeleteQuest,
                  okButtonTitle: Text.Ok, okAction: { [weak self] _ in
            CoreDataManager.shared.deleteQuest(quest)
            
            self?.dismiss(animated: false) { [weak self] in
                self?.updateHandler?()
            }

        }, cancelButtonTitle: Text.Cancel)

    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        guard let quest = quest else {
            return
        }

        CoreDataManager.shared.doneQuest(quest, isDone: !quest.isDone)
        
        dismiss(animated: true) { [weak self] in
            self?.updateHandler?()
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
            self?.updateHandler?()
        }
    }
    
    func imagePickerService(_ service: ImagePickerService,
                            finishWith error: String) {
        showOkAlert(title: "Не удалось получить фото :(", okButtonTitle: "Ок")
    }
}
