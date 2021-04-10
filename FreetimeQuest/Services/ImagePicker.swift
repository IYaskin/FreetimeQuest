//
//  ImagePicker.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.02.2021.
//

import UIKit

protocol ImagePickerServiceDelegate: class {
    func imagePickerService(_ service: ImagePickerService, finishWith image: UIImage)
    func imagePickerService(_ service: ImagePickerService, finishWith error: String)
}

extension ImagePickerServiceDelegate {
    func imagePickerService(_ service: ImagePickerService, finishWith image: UIImage) {}
    func imagePickerService(_ service: ImagePickerService, finishWith error: String) {}
}

class ImagePickerService: NSObject {
    enum MediaType {
        case photo, video

        var value: String {
            switch self {
            case .photo: return "public.image"
            case .video: return "public.movie"
            }
        }
    }
    private var selectedMediaType: MediaType = .photo

    weak var presentingViewController: UIViewController?
    weak var delegate: ImagePickerServiceDelegate?

    func presentImagePicker(_ type: UIImagePickerController.SourceType,
                            mediaType: ImagePickerService.MediaType = .photo) {
        guard UIImagePickerController.isSourceTypeAvailable(type) else { return }
        selectedMediaType = mediaType
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = type
        picker.allowsEditing = true
        picker.mediaTypes = [selectedMediaType.value]
        presentingViewController?.present(picker, animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ImagePickerService: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true) { [weak self] in
            guard let `self` = self else { return }
            switch picker.sourceType {
            case .photoLibrary, .savedPhotosAlbum:
                switch self.selectedMediaType {
                case .photo:
                    if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage  {
                        self.delegate?.imagePickerService(self,
                                                          finishWith: image)
                        return
                    } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage  {
                        self.delegate?.imagePickerService(self,
                                                          finishWith: image)
                        return
                    } else {
                        self.delegate?.imagePickerService(self, finishWith: "cantGetMedia")
                        return
                    }

                case .video:
                    return
                }

            case .camera:
                if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage  {
                    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
                    self.delegate?.imagePickerService(self,
                                                      finishWith: image)
                    return
                } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage  {
                    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
                    self.delegate?.imagePickerService(self,
                                                      finishWith: image)
                    return
                } else {
                    self.delegate?.imagePickerService(self, finishWith: "cantGetMedia")
                    return
                }
            @unknown default:
                fatalError()
            }
        }
    }
    
}

// MARK: - UINavigationControllerDelegate

extension ImagePickerService: UINavigationControllerDelegate {
    
}
