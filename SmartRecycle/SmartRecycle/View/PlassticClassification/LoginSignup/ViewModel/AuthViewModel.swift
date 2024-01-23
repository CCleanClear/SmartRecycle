//
//  AuthoViewModel.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 15/1/2024.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(WithEmail email: String, password: String, fullname: String) async throws {
        print("Create user")
    }
    
    func signOut(){
        
    }
    
    func deletedAccount(){
        
    }
    
    func fetchUser() async {
        
    }
}
