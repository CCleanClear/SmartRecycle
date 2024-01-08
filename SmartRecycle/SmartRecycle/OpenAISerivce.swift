//
//  OpenAISerivce.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import Foundation

class OpenAISerivce {
    let baseUrl = "https://api.openai.com/v1/completions"
    
    func sendMessage(message: String){
        
    }
}

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
}
