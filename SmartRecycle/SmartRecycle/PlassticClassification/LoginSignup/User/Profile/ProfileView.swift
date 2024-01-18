//
//  ProfileView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

import SwiftUI

struct ProfileView: View {
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
        if let user = viewModel.currentUser{
            HStack{
                List{
                        Section{
                            HStack{
                                Text(user.initials)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.F)
                                    .frame(width: 72, height: 72)
                                    .background(Color.sec)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading,spacing: 5){
                                    Text(user.fullname)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.top,4)
                                    
                                    Text(user.email)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                        }

                        Section("General"){
                            HStack {
                                SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                                
                                Spacer()
                                
                                Text("1.0.0")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        Section("Account"){
                            Button{
                                viewModel.signOut()
                            }label: {
                                SettingsRowView(imageName: "rectangle.portrait.and.arrow.right", title: "Sign out", tintColor: .red)
                            }
                            
                            Button{
                                print("Delete account..")
                            }label: {
                                SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                            }
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    private var verticalLayout: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color.sec)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading,spacing: 5){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Section("General"){
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account"){
                    Button{
                        viewModel.signOut()
                    }label: {
                        SettingsRowView(imageName: "rectangle.portrait.and.arrow.right", title: "Sign out", tintColor: .red)
                    }
                    
                    Button{
                        print("Delete account..")
                    }label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
