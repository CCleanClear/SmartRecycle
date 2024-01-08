//
//  ChatbotView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI

struct ChatbotView: View {
    @State var chatMeaasge: [ChatMessage] = ChatMessage.sampleMessage
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(chatMeaasge, id: \.id) {
                    message in
                    Text(message.content)
                }
            }
        }
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

