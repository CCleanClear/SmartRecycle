//
//  ContentView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

//MARK: (AuthViewModel)Source Code follow to Youtube "COMPLETE User Login / Sign Up App | Swift UI + Firebase | Async / Await" https://www.youtube.com/watch?v=QJHmhLGv-_0&list=WL&index=19&t=4624s

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedTab = 0
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabView(selection: $selectedTab) {
                    RecycleView()
                        .tabItem {
                            Image(systemName: "arrow.3.trianglepath")
                            Text("Recycle")
                        }
                        .tag(0)
                        .opacity(selectedTab == 0 ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3))
                    
                    NotesView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Notes")
                        }
                        .tag(1)
                        .opacity(selectedTab == 1 ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3))
                    
                    MapView()
                        .tabItem {
                            Image(systemName: "map")
                            Text("Map")
                        }
                        .tag(2)
                        .opacity(selectedTab == 2 ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3))
                    
                    ChatbotView()
                        .tabItem {
                            Image(systemName: "info.bubble.fill")
                            Text("Info")
                        }
                        .tag(3)
                        .opacity(selectedTab == 3 ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3))
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(4)
                        .opacity(selectedTab == 4 ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3))
                }
                .onAppear {
                    selectedTab = 0 
                }
            } else {
                LoginView()
            }
        }
    }
}
#Preview {
    ContentView()
}
