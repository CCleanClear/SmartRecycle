//
//  ListView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

import SwiftUI
import CoreData

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.order, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var addItemView = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            verticalLayout
        } else {
            horizontalLayout
        }
    }
    
    @ViewBuilder
    private var horizontalLayout: some View {
        NavigationView {
                List {
                    ForEach(items) { item in
                        HStack{
                            Text("\(item.order). ")
                            Text(item.title ?? "")
                        }
                    }
                    .onMove(perform: moveItem)
                    .onDelete(perform: deleteItem)
                }
                .navigationTitle("Order List")
                .sheet(isPresented: $addItemView){
                    AddItemView()
                }
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                    ToolbarItem {
                        Button(action: {
                            addItemView.toggle()
                        }) {
                            Label("Add Item", systemImage: "plus.rectangle")
                        }
                    }
                }
        }
    }
    
    
    @ViewBuilder
    private var verticalLayout: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack{
                        Text("\(item.order). ")
                        Text(item.title ?? "")
                    }
                }
                .onMove(perform: moveItem)
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Order List")
            .sheet(isPresented: $addItemView){
                AddItemView()
            }
            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }

                ToolbarItem {
                    Button(action: {
                        addItemView.toggle()
                    }) {
                        Label("Add Item", systemImage: "plus.rectangle")
                    }
                }
            }
        }
    }
    
    private func moveItem(at sets:IndexSet,destination:Int){
        let itemToMove = sets.first!
        
        if itemToMove < destination{
            var startIndex = itemToMove + 1
            let endIndex = destination - 1
            var startOrder = items[itemToMove].order
            while startIndex <= endIndex{
                items[startIndex].order = startOrder
                startOrder = startOrder + 1
                startIndex = startIndex + 1
            }
            items[itemToMove].order = startOrder
        }
        else if destination < itemToMove{
            var startIndex = destination
            let endIndex = itemToMove - 1
            var startOrder = items[destination].order + 1
            let newOrder = items[destination].order
            while startIndex <= endIndex{
                items[startIndex].order = startOrder
                startOrder = startOrder + 1
                startIndex = startIndex + 1
            }
            items[itemToMove].order = newOrder
        }
        
        do{
            try viewContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    private func deleteItem(at offset:IndexSet){
        withAnimation{
            offset.map{ items[$0] }.forEach(viewContext.delete)
            do{
                try viewContext.save()
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
}

#Preview {
    ListView()
}
