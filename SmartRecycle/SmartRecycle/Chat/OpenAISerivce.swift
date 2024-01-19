////
////  OpenAISerivce.swift
////  SmartRecycle
////
////  Created by Crystal Chan on 8/1/2024.
////
//
//import Foundation
//import Alamofire
//import Combine
//
//class OpenAISerivce {
//    let baseUrl = "https://api.openai.com/v1/"
//    
//    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionsResponse, Error> {
//        let body = OpenAICompletionsBody(model: "text-davinci-003", prompt: message, temperature: 0.7, max_tokens: 256)
//        let headers: HTTPHeaders = [
//            "Authorization" : "Bearer \(Constant.openAPIKey)"
//        ]
//        
//        return Future { [weak self] promise in
//            guard let self = self else {return}
//            AF.request(baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: OpenAICompletionsResponse.self) { response in
//                switch response.result {
//                case .success(let result):
//                    promise(.success(result))
//                case .failure(let error):
//                    promise(.failure(error))
//                }
//                print(response.result)
//            }
//            
//        }
//        .eraseToAnyPublisher()
//    }
//}
//
//struct OpenAICompletionsBody: Encodable {
//    let model: String
//    let prompt: String
//    let temperature: Float?
//    let max_tokens: Int
//}
//
//struct OpenAICompletionsResponse : Decodable {
//    let id :String
//    let choices : [OpenAICompletionsChoice]
//}
//
//struct OpenAICompletionsChoice : Decodable {
//    let text: String
//}
