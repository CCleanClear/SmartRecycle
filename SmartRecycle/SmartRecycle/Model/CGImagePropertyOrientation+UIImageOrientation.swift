//
//  CGImagePropertyOrientation+UIImageOrientation.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 12/1/2024.
//

//MARK: Source Code is based on GitHub "Vision-ML-SwiftUI" - https://github.com/Shakshi3104/Vision-ML-SwiftUI

import UIKit
import ImageIO

extension CGImagePropertyOrientation {
    
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        @unknown default:
            fatalError()
        }
    }
}
