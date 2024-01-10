//
//  SmartRecycleApp.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI

@main
struct SmartRecycleApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}
