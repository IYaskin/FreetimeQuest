//
//  GIF.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 04.06.2021.
//

import UIKit
import Photos
import MobileCoreServices

class GIF {
    
    static func createGif(from images: [UIImage], completion: @escaping (Bool) -> ()) {
        let fileProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: 0]]  as CFDictionary
        let frameProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [(kCGImagePropertyGIFDelayTime as String): 0.5]] as CFDictionary
        
        let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL: URL? = documentsDirectoryURL?.appendingPathComponent("FQ.gif")

        if let url = fileURL as CFURL? {
            
            if let destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, images.count, nil) {

                CGImageDestinationSetProperties(destination, fileProperties)
                
                for image in images {

                    if let cgImage = image.cgImage {
                        CGImageDestinationAddImage(destination, cgImage, frameProperties)
                    }
                    
                }

                if !CGImageDestinationFinalize(destination) {
                    completion(false)
                }

                PHPhotoLibrary.shared().performChanges({
                    let request = PHAssetCreationRequest.forAsset()
                    request.addResource(with: .photo, fileURL: fileURL!, options: nil)
                }) { (success, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            }
        }
    }

}
