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

import SwiftUI
import OpenAISwift

final class ViewModel: ObservableObject {
    init(){
    }
    private var client: OpenAISwift?
    
    func setup(){
        client = OpenAISwift(authToken: "dhkfhs")
    }
    
    func send(text: String, completion： @escaping (String)-> Void) {
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
            case .failure:
                break
            }
        })
    }
}

struct ChatbotView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var models = [String]()
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    var body: some View {
        VStack (alignment: .leading){
            ForEach(models, id: \.self) { String in
                Text(String)
            }
            
            Spacer()
            
            HStack{
                TextField("Type here...", text: $text)
            }
        }
        .padding()
    }
}

#Preview {
   ChatbotView()
}




