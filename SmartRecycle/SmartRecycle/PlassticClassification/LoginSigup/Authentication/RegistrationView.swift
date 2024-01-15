//
//  RegistrationView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 15/1/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("1024").resizable().scaledToFill()
                .frame(width: 100,height: 200)
                .padding(.vertical, 32)
        }
        
        VStack(spacing: 24) {
            InputView(text: $email, title: "Email Adress", placeholder: "name@example.com")
                .autocapitalization(.none)
            
            InputView(text: $email, title: "Full Name", placeholder: "Enter your name")
               
            
            InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecuredField: true)
            
            InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecuredField: true)
        }
        .padding(.horizontal)
        .padding(.top,12)
        
        Button{
            print("Sign user in..")
        }label: {
            HStack{
                Text("SIGN UP")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding(.top,24)
        
        Spacer()
        
        Button {
            dismiss()
        } label: {
            HStack (spacing: 3){
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
        }
    }

#Preview {
    RegistrationView()
}
