//
//  ChatbotView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

//import SwiftUI
//import Alamofire
//import Combine
//
//struct ChatbotView: View {
//    @State var chatMeaasge: [ChatMessage] = []
//    @State var messageText:String = ""
//    let openAIService = OpenAISerivce()
//    @State var cancellables = Set<AnyCancellable>()
//    
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    
//    
//    var body: some View {
//        
//        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
//            verticalLayout
//        } else {
//            horizontalLayout
//        }
//    }
//    
//    @ViewBuilder
//    private var horizontalLayout: some View {
//            VStack {
//                Text("ChatGPT")
//                    .font(.system(.title, design: .rounded)).fontWeight(.bold)
//                    .fontWeight(.bold)
//                    .padding(.top)
//                
//                Divider()
//                    .background(Color.black)
//                    .frame(height: 2)
//
//            ScrollView{
//                LazyVStack{
//                    ForEach(chatMeaasge, id: \.id) { message in
//                        messageView(message: message)
//                    }
//                }
//                .padding()
//            }
//                HStack {
//                TextField("Enter a message", text: $messageText)
//                    .padding()
//                    .background(.white)
//                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color(.gray),lineWidth: 0.5))
//                Button{
//                    sendMessage()
//                } label: {Image(systemName: "paperplane")
//                        .foregroundColor(.black)
//                        .padding()
//                        .background(Color("Sec_Color"))
//                        .cornerRadius(60)
//                }.padding(.leading, 20)
//            }
//            .padding(.vertical, 5)
//        }
//    }
//    
//    @ViewBuilder
//    private var verticalLayout: some View {
//        VStack {
//                Text("ChatGPT")
//                .font(.system(.title, design: .rounded)).fontWeight(.bold)
//                    .fontWeight(.bold)
//                    .padding(.top)
//                
//                Divider()
//                    .background(Color.black)
//                    .frame(height: 2)
//            
//                ScrollView{
//                    LazyVStack{
//                        ForEach(chatMeaasge, id: \.id) { message in
//                            messageView(message: message)
//                        }
//                    }
//                    .padding()
//                }
//                HStack{
//                    TextField("Enter a message", text: $messageText)
//                        .padding()
//                        .background(.gray.opacity(0.1))
//                        .cornerRadius(12)
//                    Button{
//                        sendMessage()
//                    } label: {Image(systemName: "paperplane")
//                            .foregroundColor(.black)
//                            .padding()
//                            .background(Color("Sec_Color"))
//                            .cornerRadius(12)
//                    }
//                }
//                .padding()
//            }
//    }
//    
//    func messageView(message: ChatMessage) -> some View {
//        HStack{
//            if message.sender == .me {Spacer()}
//            
//            Text(message.content)
//                .foregroundColor(message.sender == .me ? .white : .black)
//                .padding()
//                .background(message.sender == .me ? .thr : .gray.opacity(0.1))
//                .cornerRadius(12)
//            if message.sender == .gpt {
//                Spacer()
//            }
//        }
//    }
//    
//    func sendMessage() {
//        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
//        chatMeaasge.append(myMessage)
//        openAIService.sendMessage(message: messageText).sink{completion in
//            // Handle error
//        } receiveValue: { response in
//            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else{ return}
//            let gptMessgae = ChatMessage(id: response.id, content: textResponse, dateCreated: Date(), sender: .gpt)
//            chatMeaasge.append(gptMessgae)
//        }.store(in: &cancellables)
//        messageText = ""
//    }
//}
//
//struct ChatMessage {
//    let id: String
//    let content: String
//    let dateCreated: Date
//    let sender: MessageSender
//}
//
//enum MessageSender {
//    case me
//    case gpt
//}

//import OpenAISwift
//import SwiftUI
//
//final class ViewModel: ObservableObject {
//    init(){ }
//    private var client: OpenAISwift?
//    
//    func setup(){
//        
////        client = OpenAISwift(config: OpenAISwift.Config.makeDefaultOpenAI(apiKey: "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"))
//        let config = OpenAISwift.Config.makeDefaultOpenAI(apiKey: "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")
//                self.client = OpenAISwift(config: config)
//    }
//    
//    func send(text: String, completion: @escaping (String) -> Void) {
//        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
//            switch result {
//            case .success(let model):
//                let output = model.choices?.first?.text ?? ""
//                completion(output)
//            case .failure:
//                break
//            }
//        })
//    }
//}
//
//struct ChatbotView: View {
//    @ObservedObject var viewModel = ViewModel()
//    @State var text = ""
//    @State var models = [String]()
//    
//    @Environment(\.verticalSizeClass) var verticalSizeClass
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    
//    
//    var body: some View {
//        VStack (alignment: .leading){
//            ForEach(models, id: \.self) { string in
//                Text(string)
//            }
//            
//            Spacer()
//            
//            HStack{
//                TextField("Type here...", text: $text)
//                Button("Send") {
//                    send()
//                }
//            }
//        }
//        .onAppear {
//            viewModel.setup()
//        }
//        .padding()
//    }
//    
//    func send() {
//        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
//            return
//        }
//        models.append("Me: \(text)")
//        viewModel.send(text: text) { response in
//            DispatchQueue.main.async {
//                self.models.append("ChatGPT: " + response)
//                self.text = ""
//            }
//        }
//    }
//}


import Foundation
import ChatGPTSwift

class ChatbotViewModel: ObservableObject {

    let api = ChatGPTAPI(apiKey: "apikey")
    @Published var messages = [Message]()
    
    func getResponse(text: String) async{
        
        self.addMessage(text, type: .text, isUserMessage: true)
        self.addMessage("", type: .text, isUserMessage: false)

        do {
            let stream = try await api.sendMessageStream(text: text)

            for try await line in stream {
                DispatchQueue.main.async {
                    
                    self.messages[self.messages.count - 1].content = self.messages[self.messages.count - 1].content as! String + line
                }
            }
        } catch {
            self.addMessage(error.localizedDescription, type: .error, isUserMessage: false)
        }
    }
    
    private func addMessage(_ content: Any, type: MessageType, isUserMessage: Bool) {
        DispatchQueue.main.async {
            // if messages list is empty just addl new message
            guard let lastMessage = self.messages.last else {
                let message = Message(content: content, type: type, isUserMessage: isUserMessage)
                self.messages.append(message)
                return
            }
            let message = Message(content: content, type: type, isUserMessage: isUserMessage)
            // if last message is an indicator switch with new one
            if lastMessage.type == .indicator && !lastMessage.isUserMessage {
                self.messages[self.messages.count - 1] = message
            } else {
                // otherwise, add new message to the end of the list
                self.messages.append(message)
            }
            
            if self.messages.count > 100 {
                self.messages.removeFirst()
            }
        }
    }
    
}


//#Preview {
//   ChatbotViewModel()
//}




