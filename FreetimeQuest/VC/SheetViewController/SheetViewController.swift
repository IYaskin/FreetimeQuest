//
//  SheetViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 16.04.2021.
//

import UIKit

class SheetViewController: UIViewController {
    
    weak var mainVC: UIViewController?

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    var haveImage: Bool?
    var indexPath: IndexPath?
    
    private let imagePicker = ImagePickerService()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        contentView.layer.cornerRadius = 20
        imagePicker.delegate = self
        imagePicker.presentingViewController = self
        configureStackView()
    }
    
    func configureStackView() {
        stackView.subviews.forEach({
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
        
        guard let haveImage = haveImage else {
            addButtonToStackView(buttonType: .deleteMemory)
            return
        }
        
        addButtonToStackView(buttonType: .addPhotoFromCamera)
        addButtonToStackView(buttonType: .addPhotoFromGallery)

        if haveImage {
            addButtonToStackView(buttonType: .deletePhoto)
        }
        addButtonToStackView(buttonType: .deleteMemory)
    }
    
    func addButtonToStackView(buttonType: SheetButtons) {
        let button = UIButton()
        
        button.setTitle(buttonType.title, for: .normal)
        button.setTitleColor(UIColor.darkViolet, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkViolet.cgColor
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        switch buttonType {
        case .addPhotoFromCamera:
            button.addTarget(self, action: #selector(addPhotoFromCamera), for: .touchUpInside)
        case .addPhotoFromGallery:
            button.addTarget(self, action: #selector(addPhotoFromGallery), for: .touchUpInside)
        case .deletePhoto:
            button.addTarget(self, action: #selector(deletePhoto), for: .touchUpInside)
        case .deleteMemory:
            button.addTarget(self, action: #selector(deleteMemory), for: .touchUpInside)
        }
        button.layer.cornerRadius = 20
        stackView.addArrangedSubview(button)

    }
    
    @objc func addPhotoFromCamera() {
        imagePicker.presentImagePicker(.camera)
    }
    
    @objc func addPhotoFromGallery() {
        imagePicker.presentImagePicker(.photoLibrary)
    }
    @objc func deletePhoto() {
        guard let indexPath = indexPath else {
            return
        }
//        mainVC?.updateCell(image: nil,
//                          indexPath: indexPath)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteMemory() {
        guard let indexPath = indexPath else {
            return
        }
//        mainVC?.deleteMemory(indexPath: indexPath)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greyAreaTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }

}


extension SheetViewController: ImagePickerServiceDelegate {
    
    func imagePickerService(_ service: ImagePickerService,
                            finishWith image: UIImage) {
        guard let indexPath = indexPath else {
            return
        }
//        mainVC?.updateCell(image: image,
//                       indexPath: indexPath)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerService(_ service: ImagePickerService,
                            finishWith error: String) {
        showOkAlert(title: "Не удалось получить фото :(", okButtonTitle: "Ок")
    }
}
