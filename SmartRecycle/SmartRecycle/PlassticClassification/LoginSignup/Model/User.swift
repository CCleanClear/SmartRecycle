//
//  User.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 15/1/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        
        if let compontes = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: compontes)
        }
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Kobe Bryant", email: "test@gmail.com")
}
