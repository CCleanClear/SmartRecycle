//
//  ListView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 16/1/2024.
//

//MARK: Source Code is based on YouTube "Core Data Re-Ordered List Row / Move Row : SwiftUI" -  https://www.youtube.com/watch?v=Rh05puZsh6o&list=WL&index=9&t=28s

import SwiftUI
import CoreData

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.order, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var addItemView = false
    
    @Environment(\.verticalSizeClass) var verticalOrienation
    @Environment(\.horizontalSizeClass) var horizontalOrientation
    
    var body: some View {
        if horizontalOrientation == .compact && verticalOrienation == .regular {
            verticalDesign
        } else {
            horizontalDesign
        }
    }
    
    @ViewBuilder
    private var horizontalDesign: some View {
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
            .navigationTitle("Task List")
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
    private var verticalDesign: some View {
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
            .navigationTitle("Task List")
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
            } .tint(.black)
        }
    }
    
    internal func moveItem(at sets:IndexSet,destination:Int){
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
