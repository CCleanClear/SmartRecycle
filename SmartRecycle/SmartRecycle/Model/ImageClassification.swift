//
//  ImageClassification.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 12/1/2024.
//

//MARK: Source Code is based on GitHub "Vision-ML-SwiftUI" - https://github.com/Shakshi3104/Vision-ML-SwiftUI

import Foundation
import UIKit
import ImageIO
import CoreML
import Vision

// MARK: - Image Classification
class ImageClassification: ObservableObject {
    @Published var classificationLabel: String = "Add a photo."
    
    //Image Model
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let modelURL = Bundle.main.url(forResource: "PlasticClassifier", withExtension: "mlmodelc")!
            let model = try VNCoreMLModel(for: PlasticClassifier(contentsOf: modelURL).model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            } )
            
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    func updateClassifications(for image: UIImage) {
        classificationLabel = "Classifying..."
        
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    //update result
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                self.classificationLabel = "Unable to classify image.\n\(error!.localizedDescription)"
                return
            }
            let classifications = results as! [VNClassificationObservation]
        
            if classifications.isEmpty {
                self.classificationLabel = "Nothing recognized."
            } else {
                let topClassifications = classifications.prefix(2)
                let descriptions = topClassifications.map { classification in
                    let percentage = Int(classification.confidence * 100)
                     return String(format: "(%d%%) %@", percentage, classification.identifier)
                }
                self.classificationLabel = "Classification:\n" + descriptions.joined(separator: "\n")
            }
        }
    }
}

