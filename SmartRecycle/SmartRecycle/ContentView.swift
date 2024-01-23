//
//  ContentView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedTab = 0
    
    var body: some View {
        Group {
            if $viewModel.userSession != nil {
                TabView(selection: $selectedTab) {
                    RecycleView()
                        .tabItem {
                            Image(systemName: "arrow.3.trianglepath")
                            Text("Recycle")
                        }
                        .tag(0)
                        .opacity(selectedTab == 0 ? 1 : 0)
                        .animation(.default)
                    
                    NotesView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Notes")
                        }
                        .tag(1)
                        .opacity(selectedTab == 1 ? 1 : 0)
                        .animation(.default)
                    
                    MapView()
                        .tabItem {
                            Image(systemName: "map")
                            Text("Map")
                        }
                        .tag(2)
                        .opacity(selectedTab == 2 ? 1 : 0)
                        .animation(.default)
                    
                    ChatbotView()
                        .tabItem {
                            Image(systemName: "info.bubble.fill")
                            Text("Info")
                        }
                        .tag(3)
                        .opacity(selectedTab == 3 ? 1 : 0)
                        .animation(.default)
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(4)
                        .opacity(selectedTab == 4 ? 1 : 0)
                        .animation(.default)
                }
                .onAppear {
                    selectedTab = 0 // Set initial selected tab
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
