//
//  CollectionCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.02.2021.
//
import UIKit
import AVKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    weak var presentingViewController: UIViewController? {
        didSet {
            imagePicker.presentingViewController = presentingViewController
        }
    }

    private var imagePicker = ImagePickerService()

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imageView.image = nil
        dateLabel.text = nil
    }
    
    func configureUI() {
        imagePicker.delegate = self
    }
    
    @IBAction func photoButton(_ sender: UIButton) {
        showSheet()
    }
    
    private func showSheet() {
        let alertVC = UIAlertController(title: "Выбрать фото", message: "почему бы и нет", preferredStyle: .actionSheet)
        let openLibrary = UIAlertAction(title: "Галерея",
                                        style: .default) { _ in
            self.openPhotoLibrary()
        }
        let openCamera = UIAlertAction(title: "Камера",
                                        style: .default) { _ in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "Отмена",
                                        style: .destructive)
        alertVC.addAction(openLibrary)
        alertVC.addAction(openCamera)
        alertVC.addAction(cancel)
        presentingViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    private func showErrorAlert(error: String?) {
        let alertVC = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Окей",
                                        style: .default)
        alertVC.addAction(ok)
        presentingViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    private func openCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            imagePicker.presentImagePicker(.camera)

        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                         self.imagePicker.presentImagePicker(.camera)
                    }
                }
            }

        case .denied, .restricted:
            showErrorAlert(error: ".denied, .restricted:")
        @unknown default:
            return
        }
    }

    private func openPhotoLibrary() {
        imagePicker.presentImagePicker(.photoLibrary)
    }

    
}

    
extension CollectionCell: ImagePickerServiceDelegate {

    func imagePickerService(_ service: ImagePickerService,
                            finishWith image: UIImage,
                            fileURL: URL,
                            fileName: String) {
        imageView.image = image
//        guard let image = UIImage.scale(image, bySideValue: 1000) else {
//            assertionFailure("can't scale image")
//            return
//        }
//        proccessingSlotPhotoReport(fileURL, image: image)
    }

    func imagePickerService(_ service: ImagePickerService, finishWith error: String) {
        showErrorAlert(error: error)
    }

}
