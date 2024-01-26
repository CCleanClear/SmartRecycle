//
//  AddItemView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

//MARK: Source Code is based on YouTube "Core Data Re-Ordered List Row / Move Row : SwiftUI" -  https://www.youtube.com/watch?v=Rh05puZsh6o&list=WL&index=9&t=28s

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var itemTitle = ""
    
    @FetchRequest(sortDescriptors:[]) private var items:FetchedResults<Item>
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Add Title",text: $itemTitle)
                Button(action: {
                    saveItem()
                    dismiss()
                }, label: {
                    Text("Save Item").frame(minWidth: 0,maxWidth: .infinity)
                })
            }
            .navigationTitle("Add Item")
        }
    }
    
    private func saveItem(){
        let newItem = Item(context: viewContext)
        newItem.title = itemTitle
        newItem.order = (items.last?.order ?? 0) + 1
        newItem.timestamp = Date()
        do{
            try viewContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
}




#Preview {
    AddItemView()
}
