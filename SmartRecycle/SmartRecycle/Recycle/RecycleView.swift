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
            .navigationBarItems(leading:
                            Text("Recycling")
                                .font(.title)
                                .foregroundColor(.primary),
                                             trailing:
                            HStack {
                                NavigationLink(destination: PlasticClassificationView()) {
                                    Image(systemName: "photo")
                                        .font(.title3)
                                }
                                
                                NavigationLink(destination: ToDoListView()) {
                                    Image(systemName: "list.clipboard")
                                        .font(.title3)
                                }
                            }
                        )
                    }
                    .navigationBarTitle("", displayMode: .inline)
                }
}

#Preview {
    RecycleView()
}