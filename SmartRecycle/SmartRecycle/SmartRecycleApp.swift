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
    //let persistentContainer = CoreDataManager.shared.persistentContainer
    init(){
        FirebaseApp.configure()
    }
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
                //.environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
