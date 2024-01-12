//
//  RecycleView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 9/1/2024.
//

import SwiftUI

struct RecycleView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(recycles,id: \.self) {recycle in
                    NavigationLink{
                        RecycleDetailView(recycle: recycle)
                    } label: {
                        CardView(image: recycle.image, title: recycle.title, stitle: recycle.stitle, desc: recycle.desc)
                    }
                    
                }
            }
            .navigationBarTitle("Recycling")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    HStack () {
                NavigationLink(destination: PlasticClassificationView() ) {
                    Image(systemName: "photo")
                        .font(.title2)
                }
                NavigationLink(destination: ToDoListView()) {
                    Image(systemName: "list.clipboard")
                        .font(.title2)
                }
                
            }.padding(.vertical)
            )
        }
    }
}

#Preview {
    RecycleView()
}
