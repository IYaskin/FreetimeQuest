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
    @IBOutlet weak var photoButton: UIButton!
    
    weak var presentingViewController: UIViewController? {
        didSet {
            imagePicker.presentingViewController = presentingViewController
        }
    }

    weak var quest: Quest? {
        didSet {
            updateUI()
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
        quest = nil
    }
    
    private func configureUI() {
        imagePicker.delegate = self
        photoButton.setImage(UIImage(named: "camera"), for: .normal)
    }
    
    private func updateUI() {
        guard let quest = quest else {
            titleLabel.text = ""
            dateLabel.text = ""
            imageView.image = nil
            return
        }

        if let imageData = quest.imageData,
           let image = UIImage(data: imageData) {
            photoButton.isHidden = true
            imageView.image = image
        } else {
            photoButton.isHidden = false
        }
        
        titleLabel.text = quest.title
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        let date = Date(timeIntervalSince1970: quest.date)
        let strDate = df.string(from: date)
        dateLabel.text = strDate
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
    
    func printUserDefaults() {
        
        let uselessKeysArray = ["AKLastIDMSEnvironment",
                                "AppleLanguages",
                                "AddingEmojiKeybordHandled",
                                "NSLanguages",
                                "PKKeychainVersionKey",
                                "AppleKeyboards",
                                "AppleKeyboardsExpanded",
                                "AppleLanguagesDidMigrate",
                                "AppleITunesStoreItemKinds",
                                "NSInterfaceStyle",
                                "PKLogNotificationServiceResponsesKey",
                                "ApplePasscodeKeyboards",
                                "NSAllowsDefaultLineBreakStrategy"]
        
        print("---------------------------------------------------------------------")
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            if !uselessKeysArray.contains(key) {
                print("\(key) = \(value) \n")
            }
        }
        print("---------------------------------------------------------------------")

    }


    
}

    
extension CollectionCell: ImagePickerServiceDelegate {

    func imagePickerService(_ service: ImagePickerService,
                            finishWith image: UIImage,
                            fileURL: URL,
                            fileName: String) {
        imageView.image = image
        photoButton.isHidden = true
        if let imageData = image.jpegData(compressionQuality: 1) {
            quest?.imageData = imageData
            //printUserDefaults()
        }
    }

    func imagePickerService(_ service: ImagePickerService, finishWith error: String) {
        showErrorAlert(error: error)
    }

}
