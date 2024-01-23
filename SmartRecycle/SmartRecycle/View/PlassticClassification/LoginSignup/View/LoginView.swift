//
//  LoginView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

import SwiftUI
import PhotosUI
import Firebase

struct LoginView: View {
    @State var emailID: String = ""
    @State var password: String = ""
    @State var createAccount: Bool = false
    @State var showError: Bool = false
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
    @State var userBioLink: String = ""
    @State var userProfilePicData: Data?
    @Environment(\.dismiss) var dismiss
    @State var showImagePicker: Bool = false
    @State var photoItem: PhotosPickerItem?
    
    var body: some View{
        VStack(spacing: 10){
            Text("Lets Register\nAccount")
                .font(.largeTitle.bold())
                .hAlign(.leading)
            
            Text("Hello user, have a wonderful journey")
                .font(.title3)
                .hAlign(.leading)
            
            ViewThatFits {
                ScrollView(.vertical, showsIndicators: false) {
                    HelperView()
                }
                HelperView()
            }
            
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
                
                TextField("About you", text: $userBio, axis: .vertical)
                    .frame(minHeight: 100, alignment:.top)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                
                TextField("Bio LInk (Optional)", text: $userBioLink)
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
        .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
        .onChange(of: photoItem) {newValue in
            if let newValue{
                Task{
                    do{
                        guard let imageData  = try await newValue.loadTransferable(type: Data.self) else {
                            return
                        }
                        await MainActor.run(body: {
                            userProfilePicData = imageData
                        })
                        
                    } catch {}
                }
            }
        }
    }
    
    @ViewBuilder
    func HelperView() -> some View {
        VStack (spacing: 12){
            
            ZStack{
                if let userProfilePicData, let image = UIImage(data: userProfilePicData){
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image("NULLProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .frame(width: 85, height: 85)
            .clipShape(Circle())
            .contentShape(Circle())
            .onTapGesture {
                showImagePicker.toggle()
            }
            .padding(.top,25)
            
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
            
            TextField("About you", text: $userBio, axis: .vertical)
                .frame(minHeight: 100, alignment:.top)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.5))
            
            TextField("Bio LInk (Optional)", text: $userBioLink)
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

