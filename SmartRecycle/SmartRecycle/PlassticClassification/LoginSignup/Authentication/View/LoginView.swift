//
//  LoginView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

//MARK: Source Code follow to Youtube "COMPLETE User Login / Sign Up App | Swift UI + Firebase | Async / Await" https://www.youtube.com/watch?v=QJHmhLGv-_0&list=WL&index=19&t=4624s

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            verticalLayout
        } else {
            horizontalLayout
        }
    }
    
    @ViewBuilder
    private var horizontalLayout: some View {
        NavigationStack{
            HStack (spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Smart Recycle")
                        .font(.title.bold())
                    
                    Image("1024")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.vertical,32)
                }
                
                VStack (spacing:24){
                    VStack(spacing:24){
                        InputView(text: $email,
                                  title: "Email Address",
                                  placeholder: "name@example.com")
                        .autocapitalization(.none)
                        
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter your password",isSecuredField: true)
                        
                    }
                    .padding(.horizontal, 40)
                    .padding(.top,40)
                    
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
                        .frame(width: 350, height: 45)
                    }
                    .background(Color(red: 1, green: 0.5, blue: 0, opacity: 1))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(10)
                    .padding(.top,24)
                    
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
                        .font(.system(size: 15))
                        .padding(.vertical,3)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var verticalLayout: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Smart Recycle")
                .font(.title.bold())
        }
        NavigationStack{
            VStack{
                
                Image("1024")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.vertical,32)
                
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
                .background(Color(red: 1, green: 0.5, blue: 0, opacity: 1))
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
                    .font(.system(size: 15))
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

