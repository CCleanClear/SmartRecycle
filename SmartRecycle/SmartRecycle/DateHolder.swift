//
//  DataHolder.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 10/1/2024.
//

import SwiftUI
import CoreData

class DateHolder: ObservableObject
{

        
    init(_ context: NSManagedObjectContext)
    {
        
    }
    
    func saveContext(_ context: NSManagedObjectContext)
    {
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

//#Preview {
//    DataHolder()
//}
