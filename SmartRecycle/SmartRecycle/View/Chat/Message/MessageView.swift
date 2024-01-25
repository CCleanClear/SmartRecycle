//
//  MessageView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 20/1/2024.
//

//MARK: Source Code follow to GitHub "SwiftGPT" https://github.com/mbabicz/SwiftGPT?tab=readme-ov-file

import SwiftUI

struct MessageView: View {
    var message: Message

    var body: some View {
        HStack(spacing: 5) {
            if message.isUserMessage {
                            Spacer()
                        }
            VStack(alignment: message.isUserMessage ? .leading : .trailing,  spacing: 5) {
                HStack(alignment: message.isUserMessage ? .center : .top){
                    
                    Image(message.isUserMessage ? "person-icon" : "chat-gpt-logo")
                        .resizable()
                        .cornerRadius(3.0)
                        .frame(width: 30, height: 30)
                        .padding(.leading, 2)

                    switch message.type {
                    case .text:
                        let output = (message.content as! String)//.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\"")))
                        Text(output)
                            .padding([.vertical, .horizontal],5)
                            .textSelection(.enabled)
                    case .error:
                        let output = (message.content as! String)//.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\"")))
                        Text(output)
                            .foregroundColor(.red)
                            .textSelection(.enabled)

                    case .indicator:
                        MessageIndicatorView()
                        
                    }
                }
                .padding([.vertical, .horizontal])
                .background(message.isUserMessage ? Color.thr : Color.sec)
                .foregroundColor(message.isUserMessage ? Color.white : Color.black)
                .cornerRadius(12)
                .shadow(radius: message.isUserMessage ? 0 : 0.5)
            }
            if !message.isUserMessage {
                            Spacer()
                        }
        }
        .padding(.horizontal, 5)
        .padding(.leading, message.isUserMessage ? 0 : 3)

    }
}


//#Preview {
//    MessageView()
//}
