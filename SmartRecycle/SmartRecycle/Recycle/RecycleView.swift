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
                .font(.system(.title, design: .rounded)).fontWeight(.bold)
                                .foregroundColor(.primary),
                                             trailing:
                            HStack {
                                NavigationLink(destination: PlasticClassificationView()) {
                                    Image(systemName: "camera.viewfinder")
                                        .font(.title3)
                                        .padding(.top, 3)
                                }
                                
                NavigationLink(destination: ListView()) {
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
