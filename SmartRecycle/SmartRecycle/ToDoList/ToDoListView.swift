//
//  ToDoListView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 10/1/2024.
//

//import SwiftUI
//
//enum Priority: String, Identifiable, CaseIterable {
//    
//    var id: UUID {
//        return UUID()
//    }
//    
//    case low = "Low"
//    case medium = "Medium"
//    case high = "High"
//}
//
//extension Priority {
//    
//    var title: String {
//        switch self {
//            case .low:
//                return "Low"
//            case .medium:
//                return "Medium"
//            case .high:
//                return "High"
//        }
//    }
//}
//
//
//struct ToDoListView: View {
//    
//    @State private var title: String = ""
//    @State private var selectedPriority: Priority = .medium
//    @Environment(\.managedObjectContext) private var viewContext
//    
//    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allTasks: FetchedResults<Task>
//    
//    private func saveTask() {
//        
//        do {
//            let task = Task(context: viewContext)
//            task.title = title
//            task.priority = selectedPriority.rawValue
//            task.dateCreated = Date()
//            try viewContext.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//        
//    }
//    
//    private func styleForPriority(_ value: String) -> Color {
//        let priority = Priority(rawValue: value)
//        
//        switch priority {
//            case .low:
//                return Color.green
//            case .medium:
//                return Color.orange
//            case .high:
//                return Color.red
//            default:
//                return Color.black
//        }
//    }
//    
//    private func updateTask(_ task: Task) {
//        
//        task.isDone = !task.isDone
//        
//        do {
//            try viewContext.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//    private func deleteTask(at offsets: IndexSet) {
//        offsets.forEach { index in
//            let task = allTasks[index]
//            viewContext.delete(task)
//            
//            do {
//                try viewContext.save()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Enter title", text: $title)
//                    .textFieldStyle(.roundedBorder)
//                Picker("Priority", selection: $selectedPriority) {
//                    ForEach(Priority.allCases) { priority in
//                        Text(priority.title).tag(priority)
//                    }
//                }.pickerStyle(.segmented)
//                
//                Button("Save") {
//                    saveTask()
//                }
//                .padding(10)
//                .frame(maxWidth: .infinity)
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
//                
//                List {
//                    
//                    ForEach(allTasks) { task in
//                        HStack {
//                            Circle()
//                                .fill(styleForPriority(task.priority!))
//                                .frame(width: 15, height: 15)
//                            Spacer().frame(width: 20)
//                            Text(task.title ?? "")
//                            Spacer()
//                            Image(systemName: task.isDone ? "checkmark.circle.fill": "checkmark.circle")
//                                .foregroundColor(.green)
//                                .onTapGesture {
//                                    updateTask(task)
//                                }
//                        }
//                    }.onDelete(perform: deleteTask)
//                    
//                }
//                
//                
//                Spacer()
//            }
//            .padding()
//            .navigationTitle("To Do Tasks")
//        }
//    }
//}

//#Preview {
//    let persistedContainer = CoreDataManager.shared.persistentContainer
//    ToDoListView().environment(\.managedObjectContext, persistedContainer.viewContext)
//}
