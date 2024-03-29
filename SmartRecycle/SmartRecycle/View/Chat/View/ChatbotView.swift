//
//  ChatbotView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 20/1/2024.
//

//MARK: Source Code is based on GitHub "SwiftGPT" - https://github.com/mbabicz/SwiftGPT?tab=readme-ov-file

import SwiftUI

struct ChatbotView: View {
    
    @ObservedObject var gpt3ViewModel = ChatbotViewModel()
    @State var typingMessage: String = ""
    @Namespace var bottomID
    @FocusState private var fieldIsFocused: Bool
    
    @Environment(\.verticalSizeClass) var verticalOrientation
    @Environment(\.horizontalSizeClass) var horizontalOrientation
    
    var body: some View {
        if horizontalOrientation == .compact && verticalOrientation == .regular {
            verticalDesign
        } else {
            horizontalDesign
        }
    }
    
    @ViewBuilder
    private var horizontalDesign: some View {
        NavigationView(){
            VStack(alignment: .leading){
                if !gpt3ViewModel.messages.isEmpty{
                    ScrollViewReader { reader in
                        ScrollView(.vertical) {
                            ForEach(gpt3ViewModel.messages) { message in
                                MessageView(message: message)
                            }
                            Text("").id(bottomID)
                        }
                        
                        .onChange(of: gpt3ViewModel.messages.last?.content as? String) { _ in
                            DispatchQueue.main.async {
                                withAnimation {
                                    reader.scrollTo(bottomID)
                                }
                            }
                        }
                        .onChange(of: gpt3ViewModel.messages.count) { _ in
                            withAnimation {
                                reader.scrollTo(bottomID)
                            }
                        }
                        
                        .onAppear {
                            withAnimation {
                                reader.scrollTo(bottomID)
                            }
                        }
                    }
                } else {
                    VStack{
                        Image(systemName: "ellipses.bubble")
                            .font(.largeTitle)
                        Text("Write your first message!")
                            .font(.subheadline)
                            .padding(10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.gray)
                }
                
                HStack(alignment: .center){
                    TextField("Message...", text: $typingMessage, axis: .vertical)
                        .focused($fieldIsFocused)
                        .padding()
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onTapGesture {
                            fieldIsFocused = true
                        }
                    Button(action: sendMessage) {
                        Image(systemName: typingMessage.isEmpty ? "circle" : "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(typingMessage.isEmpty ? .gray.opacity(0.75) : .thr)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                }
                .onDisappear {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }
                .background(.F)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.gray),lineWidth: 0.5))
                .padding([.leading, .trailing, .bottom], 10)
                //.shadow(color: .black, radius: 0.5)
            }
            .background(.white)
            //            .gesture(TapGesture().onEnded {
            //                hideKeyboard()
            //            })
            .navigationTitle("ChatGPT")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private var verticalDesign: some View {
        NavigationView(){
            VStack(alignment: .leading){
                if !gpt3ViewModel.messages.isEmpty{
                    ScrollViewReader { reader in
                        ScrollView(.vertical) {
                            ForEach(gpt3ViewModel.messages) { message in
                                MessageView(message: message)
                            }
                            Text("").id(bottomID)
                        }
                        
                        .onChange(of: gpt3ViewModel.messages.last?.content as? String) { _ in
                            DispatchQueue.main.async {
                                withAnimation {
                                    reader.scrollTo(bottomID)
                                }
                            }
                        }
                        .onChange(of: gpt3ViewModel.messages.count) { _ in
                            withAnimation {
                                reader.scrollTo(bottomID)
                            }
                        }
                        
                        .onAppear {
                            withAnimation {
                                reader.scrollTo(bottomID)
                            }
                        }
                    }
                } else {
                    VStack{
                        Image(systemName: "ellipses.bubble")
                            .font(.largeTitle)
                        Text("Write your first message!")
                            .font(.subheadline)
                            .padding(10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                HStack(alignment: .center){
                    TextField("Message...", text: $typingMessage, axis: .vertical)
                        .focused($fieldIsFocused)
                        .padding()
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onTapGesture {
                            fieldIsFocused = true
                        }
                    Button(action: sendMessage) {
                        Image(systemName: typingMessage.isEmpty ? "circle" : "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(typingMessage.isEmpty ? .gray.opacity(0.75) : .thr)
                            .frame(width: 20, height: 20)
                            .padding()
                    }
                }
                .onDisappear {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }
                .background(.white)
                .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color(.gray),lineWidth: 0.5))
                .padding([.leading, .trailing, .bottom], 10)
            }
            .background(.white)
            .navigationTitle("ChatGPT")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    private func sendMessage() {
        guard !typingMessage.isEmpty else { return }
        let tempMessage = typingMessage
        typingMessage = ""
        
        Task{
            await gpt3ViewModel.getResponse(text: tempMessage)
        }
    }
    
    
}

#Preview {
    ChatbotView()
}
