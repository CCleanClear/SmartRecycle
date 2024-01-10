//
//  TaskListView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 10/1/2024.
//


import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @FetchRequest (sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)])
   
    private var items: FetchedResults<TaskItem>

    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                ZStack
                {
                    List
                    {
                        ForEach(items)
                        { taskItem in
                            NavigationLink(destination: TaskEditView(passedTaskItem: taskItem, initialDate: taskItem.dueDate!)
                                .environmentObject(dateHolder))
                            {
                                TaskCell(passedTaskItem: taskItem)
                                    .environmentObject(dateHolder)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            EditButton()
                            }
                        }
            
                    
                    FloatingButton()
                }
            }
            .navigationTitle("To Do List")
        }
    }

    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    TaskListView()
}
