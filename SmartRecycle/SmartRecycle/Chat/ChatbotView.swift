//
//  ChatbotView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI
import Combine

struct ChatbotView: View {
    @State var chatMeaasge: [ChatMessage] = []
    @State var messageText:String = ""
    let openAIService = OpenAISerivce()
    @State var cancellables = Set<AnyCancellable>()
    var body: some View {
        VStack {
        ScrollView{
            LazyVStack{
                ForEach(chatMeaasge, id: \.id) { message in
                    messageView(message: message)
                }
            }
            .padding()
        }
            HStack{
                TextField("Enter a message", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button{
                    sendMessage()
                } label: {Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
    func messageView(message: ChatMessage) -> some View {
        HStack{
            if message.sender == .me {Spacer()}
            
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1))
                .cornerRadius(16)
            if message.sender == .gpt {
                Spacer()
            }
        }
    }
    
    func sendMessage() {
        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        chatMeaasge.append(myMessage)
        openAIService.sendMessage(message: messageText).sink{completion in
            // Handle error
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else{ return}
            let gptMessgae = ChatMessage(id: response.id, content: textResponse, dateCreated: Date(), sender: .gpt)
            chatMeaasge.append(gptMessgae)
        }.store(in: &cancellables)
        messageText = ""
    }
}

struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}


#Preview {
   ChatbotView()
}

