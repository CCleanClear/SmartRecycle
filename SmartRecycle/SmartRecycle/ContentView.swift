//
//  ContentView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NotesView().tabItem({
                Image(systemName: "square.and.pencil")
                Text("Notes")
            }).tag(0)
            
            MapView().tabItem({
                Image(systemName: "map")
                Text("Map")
            }).tag(1)
        }
    }
}

#Preview {
    ContentView()
}
