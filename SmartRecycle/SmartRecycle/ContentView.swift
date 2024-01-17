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
    
    var body: some View {
//        Group{
//            if viewModel.userSession != nil{
//                ProfileView()
//            }else{
//                LoginView()
//            }
//        }
        Group{
            if viewModel.userSession != nil {
                TabView{
                    RecycleView().tabItem({
                        Image(systemName: "arrow.3.trianglepath")
                        Text("Recycle")
                    }).tag(0)
                    
                    
                    NotesView().tabItem({
                        Image(systemName: "square.and.pencil")
                        Text("Notes")
                    }).tag(1)
                    
                    MapView().tabItem({
                        Image(systemName: "map")
                        Text("Map")
                    }).tag(2)
                    
                    ChatbotView().tabItem({
                        Image(systemName: "info.bubble.fill")
                        Text("Info")
                    }).tag(3)
                    
                    ProfileView().tabItem({
                        Image(systemName: "gearshape")
                        Text("Profile")
                    }).tag(4)
                }
               
            } else {
                LoginView ()
            }
        }
        
    }
}
#Preview {
    ContentView()
}
