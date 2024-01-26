//
//  SmartRecycleApp.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

//MARK: (AuthViewModel) Source Code is based on YouTube "COMPLETE User Login / Sign Up App | Swift UI + Firebase | Async / Await" - https://www.youtube.com/watch?v=QJHmhLGv-_0&list=WL&index=19&t=4624s

//MARK: (Persisitence) Source Code is based on YouTube "Core Data Re-Ordered List Row / Move Row : SwiftUI" - https://www.youtube.com/watch?v=Rh05puZsh6o&list=WL&index=9&t=28s

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
