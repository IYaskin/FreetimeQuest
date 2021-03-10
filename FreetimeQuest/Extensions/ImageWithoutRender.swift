//
//  ImageWithoutRender.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 06.03.2021.
//

import UIKit

class ImageWithoutRender: UIImage {
    override func withRenderingMode(_ renderingMode: UIImage.RenderingMode) -> UIImage {
        return self
    }
    
}
