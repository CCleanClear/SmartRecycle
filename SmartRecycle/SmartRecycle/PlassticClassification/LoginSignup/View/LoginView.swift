//
//  LoginView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

import SwiftUI

struct LoginView: View {
    @State var emailID: String = ""
    @State var password: String = ""
    @State var createAccount: Bool = false
        var body: some View {
            VStack(spacing: 10){
                Text("Lets Sign you in")
                    .font(.largeTitle.bold())
                    .hAlign(.leading)
                
                Text("Weclome Back, \nYou have been missed")
                    .font(.title3)
                    .hAlign(.leading)
                
                VStack (spacing: 12){
                    TextField("Email", text: $emailID)
                        .textContentType(.emailAddress)
                        .border(1, .gray.opacity(0.5))
                        .padding(.top,25)
                    
                    TextField("Password", text: $password)
                        .textContentType(.emailAddress)
                        .border(1, .gray.opacity(0.5))
                        .padding(.top,25)
                    
                    Button("Reset password?", action: {})
                        .font(.callout)
                        .fontWeight(.medium)
                        .tint(.black)
                        .hAlign(.trailing)
                    
                    
                    Button{
                        
                        
                        
                    } label: {
                        Text("Sign in")
                            .foregroundColor(.white)
                            .hAlign(.center)
                            .fillView(.black)
                    }
                    .padding(.top,10)
                    
                }
                HStack{
                    Text("Don't have an account? ")
                        .foregroundColor(.gray)
                    
                    Button("Regsiter Now") {
                        createAccount.toggle()
                    }.fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .font(.callout)
                .vAlign(.bottom)
            }
            .vAlign(.top)
            .padding(15)
            
            .fullScreenCover(isPresented: $createAccount) {
                RegisterView()
            }
        }

}

struct RegisterView: View {
    @State var emailID: String = ""
    @State var password: String = ""
    @State var userName: String = ""
    @State var userBio: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack(spacing: 10){
            Text("Lets Register\nAccount")
                .font(.largeTitle.bold())
                .hAlign(.leading)
            
            Text("Hello user, have a wonderful journey")
                .font(.title3)
                .hAlign(.leading)
            
            VStack (spacing: 12){
                TextField("Username", text: $userName)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                    .padding(.top,25)
                
                TextField("Email", text: $emailID)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                
                TextField("Password", text: $password)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                
                
                Button{
                    
                    
                    
                } label: {
                    Text("Sign up")
                        .foregroundColor(.white)
                        .hAlign(.center)
                        .fillView(.black)
                }
                .padding(.top,10)
                
            }
            HStack{
                Text("Already Have an account? ")
                    .foregroundColor(.gray)
                
                Button("Login Now") {
                    dismiss()
                }.fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .font(.callout)
            .vAlign(.bottom)
        }
        .vAlign(.top)
        .padding(15)
    }
}

#Preview {
    LoginView()
    //RegisterView()
}

extension View {
    func hAlign(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign (_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func border(_ width: CGFloat, _ color: Color) -> some View {
        self.padding(.horizontal,15).padding(.vertical, 10).background(RoundedRectangle(cornerRadius: 5, style: .continuous)
            .stroke(color, lineWidth: width))
    }
    
    func fillView(_ color: Color) -> some View {
        self.padding(.horizontal,15).padding(.vertical,10).background(RoundedRectangle(cornerRadius: 5, style: .continuous).fill(color))
    }
    
}

