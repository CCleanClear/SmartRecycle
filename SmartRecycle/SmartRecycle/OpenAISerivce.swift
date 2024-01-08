//
//  OpenAISerivce.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import Foundation
import Alamofire

class OpenAISerivce {
    let baseUrl = "https://api.openai.com/v1/completions"
    
    func sendMessage(message: String){
        let body = OpenAICompletionsBody(model: "text-davinci-003", prompt: message, temperature: 0.7)
        let headers: HTTPHeaders = [
            "Authorization" : "Barer \(Constant.openAPIKey)"
        ]
        
        AF.request(baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).response { data in
            print(data.result)
        }
    }
}

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
}

struct OpenAICompletionsResponse : Decodable {
    let id :String
    let option : [OpenAICompletionsOptions]
}

struct OpenAICompletionsOptions : Decodable {
    let text: String
}
