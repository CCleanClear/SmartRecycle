//
//  ProfileView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 15/1/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section{
                HStack{
                    Text("MJ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack (alignment: .leading, spacing: 4){
                        Text("Michael Jordan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top,4)
                        
                        Text("test@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                    }
                }
            }
            
            Section("Genreal"){
                HStack{
                    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Section("Account") {
                Button{
                    print("Sign out..")
                } label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
                
                Button{
                    print("Delete account..")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
