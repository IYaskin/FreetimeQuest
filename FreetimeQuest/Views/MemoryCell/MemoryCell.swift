//
//  MemoryCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 20.03.2021.
//

import UIKit

class MemoryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    static let nibName = "MemoryCell"
    static let reuseID = "MemoryCell"
    
    private let imagePicker = ImagePickerService()
    
    weak var vc: MemoryViewController? {
        didSet {
            imagePicker.presentingViewController = vc
        }
    }
    
    var indexPath: IndexPath?

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        imgView.image = nil
    }
    
    func configureUI() {
        selectionStyle = .none
        bgView.layer.cornerRadius = 20
        imgView.layer.cornerRadius = 20
        imgView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        imagePicker.delegate = self
    }
    
    func configure(title: String,
                   date: Date,
                   imageData: Data?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let date = formatter.string(from: date)
        
        titleLabel.text = date + "\n" + title


        if let data = imageData,
           let image = UIImage(data: data) {
            imgView.isHidden = false
            imgView.image = image
        } else {
            imgView.isHidden = true
        }

    }
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "Галерея", style: .default) { [weak self] _ in
            self?.imagePicker.presentImagePicker(.photoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { [weak self] _ in
            self?.imagePicker.presentImagePicker(.camera)
        }

        let deleteAction = UIAlertAction(title: "Удалить", style: .default) { [weak self] _ in
            guard let indexPath = self?.indexPath else {
                return
            }
            self?.vc?.updateCell(image: nil,
                                 indexPath: indexPath)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        vc?.present(alert, animated: true, completion: nil)
    }
    
}

extension MemoryCell: ImagePickerServiceDelegate {
    func imagePickerService(_ service: ImagePickerService,
                            finishWith image: UIImage,
                            fileURL: URL,
                            fileName: String) {
        guard let indexPath = indexPath else {
            return
        }
        vc?.updateCell(image: image,
                       indexPath: indexPath)
    }
}
