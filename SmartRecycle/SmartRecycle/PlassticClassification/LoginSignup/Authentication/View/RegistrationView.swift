//
//  RegistrationView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

//MARK: Source Code follow to Youtube "COMPLETE User Login / Sign Up App | Swift UI + Firebase | Async / Await" https://www.youtube.com/watch?v=QJHmhLGv-_0&list=WL&index=19&t=4624s

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
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
        HStack{
            VStack{
                // image
                Image("1024")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.vertical,32)
            }
            
            VStack{
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "Enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",isSecuredField: true)
                
                ZStack(alignment: .trailing){
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password password",isSecuredField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else{
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
                
                HStack{
                    //sign in button
                    Button{
                        fullName = NameRule(userName: fullName)
                        Task{
                            try await viewModel.createUser(withEmail:email,
                                                           password:password,
                                                           fullName:fullName)
                        }
                    }label: {
                        HStack{
                            Text("SIGN UP")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(width: 350, height: 45)
                    }
                    .background(Color(red: 1, green: 0.5, blue: 0, opacity: 1))
                    .cornerRadius(10)
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .padding(.vertical,8)
                    
                }
                
                Button{
                    dismiss()
                }label: {
                    HStack(spacing:3){
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .padding(.bottom,3)
                }
            }.padding(.horizontal, 10)
                .padding(.top, 30)
        }
    }
    
    @ViewBuilder
    private var verticalLayout: some View {
        VStack{
            // image
            Image("1024")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.vertical,32)
            
            VStack(spacing:24){
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "Enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",isSecuredField: true)
                
                ZStack(alignment: .trailing){
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password password",isSecuredField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else{
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            //sign in button
            Button{
                fullName = NameRule(userName: fullName)
                Task{
                    try await viewModel.createUser(withEmail:email,
                                                   password:password,
                                                   fullName:fullName)
                }
            }label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(red: 1, green: 0.5, blue: 0, opacity: 1))
            .cornerRadius(10)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .padding(.top,10)
            
            Button{
                dismiss()
            }label: {
                HStack(spacing:3){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                .padding(.bottom,3)
            }
        }
    }
    
    func NameRule(userName: String) -> String {
        if userName.count <= 0 {
            return "Please input name"
        } else if userName.count > 20 {
            return "Over maximum limit"
        } else {
            return userName
        }
    }
    
    
}

extension RegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullName.isEmpty
    }
}

#Preview {
    RegistrationView()
}
