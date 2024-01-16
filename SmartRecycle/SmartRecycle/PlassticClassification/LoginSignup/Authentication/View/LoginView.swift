//
//  LoginView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                // image
                Image("1024")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.vertical,32)
                
                // text Fields
                VStack(spacing:24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",isSecuredField: true)
                    
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                //sign in button
                Button{
                    Task{
                        try await viewModel.signIn(withEmail:email,password:password)
                    }
                }label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top,24)
                
                Spacer()
                //sign up
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .padding(.bottom,3)
                }
            }
        }
    }
}

//MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}

