//
//  ChatbotView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI

struct ChatbotView: View {
    @State var chatMeaasge: [ChatMessage] = ChatMessage.sampleMessage
    @State var messageText:String = ""
    var body: some View {
        VStack {
        ScrollView{
            LazyVStack{
                ForEach(chatMeaasge, id: \.id) { message in
                    messageView(message: message)
                }
            }
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
        messageText = ""
        print(messageText)
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

extension ChatMessage{
    static let sampleMessage = [
        ChatMessage(id: UUID().uuidString, content: "Sample Message From me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From gpt", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From gpt", dateCreated: Date(), sender: .gpt)
    ]
}

#Preview {
    ChatbotView()
}

