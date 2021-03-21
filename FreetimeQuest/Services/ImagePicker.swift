//
//  ImagePicker.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 05.02.2021.
//

import UIKit

protocol ImagePickerServiceDelegate: class {
    func imagePickerService(_ service: ImagePickerService, finishWith image: UIImage, fileURL: URL, fileName: String)
    func imagePickerService(_ service: ImagePickerService, finishWith error: String)
}

extension ImagePickerServiceDelegate {
    func imagePickerService(_ service: ImagePickerService, finishWith image: UIImage, fileURL: URL, fileName: String) {}
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
    private let fileManager = FileManager.default
    private var tempDirectory: URL {
        return fileManager.temporaryDirectory
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
        if type == .photoLibrary {
            picker.allowsEditing = true
        }
        picker.mediaTypes = [selectedMediaType.value]
        presentingViewController?.present(picker, animated: true)
    }
    
    private func saveImage(_ image: UIImage) -> (url: URL?, error: Error?) {
        let imageData = image.jpegData(compressionQuality: 1.0)
        let fileURL = tempDirectory.appendingPathComponent(String(Date().timeIntervalSince1970) + ".jpg")
        do {
            try imageData?.write(to: fileURL)
            return (fileURL, nil)
        } catch {
            return (nil, error)
        }
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
                    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                        self.delegate?.imagePickerService(self, finishWith: "cantGetMedia")
                        return
                    }
                    guard let fileURL = info[UIImagePickerController.InfoKey.imageURL] as? URL else {
                        self.delegate?.imagePickerService(self, finishWith: "cantGetMediaUrl")
                        return
                    }
                    self.delegate?.imagePickerService(self,
                                                      finishWith: image,
                                                      fileURL: fileURL,
                                                      fileName: fileURL.lastPathComponent)

                case .video:
                    return
                }

            case .camera:
                guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                    self.delegate?.imagePickerService(self, finishWith: "cantGetMedia")
                    return
                }
                let result = self.saveImage(image)
                if let error = result.error {
                    self.delegate?.imagePickerService(self, finishWith: "cantGetMediaUrl + \(error.localizedDescription)")
                    return
                }
                if let url = result.url {
                    self.delegate?.imagePickerService(self,
                                                      finishWith: image,
                                                      fileURL: url,
                                                      fileName: url.lastPathComponent)
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
