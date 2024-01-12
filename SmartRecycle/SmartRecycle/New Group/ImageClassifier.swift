//
//  ImageClassifier.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 12/1/2024.
//

import Foundation

import SwiftUI
class ImageClassifier: ObservableObject {
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
    
    func detect(uiImage: UIImage){
        guard let ciImage = CIImage (image: uiImage)
        else {
            return
        }
        classifier.detect(ciImage: ciImage)
        
    }
}
