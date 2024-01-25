//
//  ProfileView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

//MARK: Source Code follow to Youtube "COMPLETE User Login / Sign Up App | Swift UI + Firebase | Async / Await" https://www.youtube.com/watch?v=QJHmhLGv-_0&list=WL&index=19&t=4624s

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.verticalSizeClass) var verticalOrienatation
    @Environment(\.horizontalSizeClass) var horizontalOrienatation
    
    var body: some View {
        if horizontalOrienatation == .compact && verticalOrienatation == .regular {
            verticalDesign
        } else {
            horizontalDesign
        }
    }
    
    @ViewBuilder
    private var horizontalDesign: some View {
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
                        
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var verticalDesign: some View {
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
                    
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
