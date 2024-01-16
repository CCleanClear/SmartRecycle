//
//  SmartRecycleApp.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI
import Firebase

@main
struct SmartRecycleApp: App {
    @StateObject var viewModel = AuthViewModel()
    let persistenceController = PersistenceController.shared
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel).environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
