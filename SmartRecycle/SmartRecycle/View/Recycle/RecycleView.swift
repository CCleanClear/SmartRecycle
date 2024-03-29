//
//  RecycleView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 9/1/2024.
//

//MARK: Source Code is based on YouTube "Simple CardView Screen Design in SwiftUI" - https://www.youtube.com/watch?v=af1KHNuSCUA&list=WL&index=13

import SwiftUI

struct RecycleView: View {
    @Environment(\.verticalSizeClass) var verticalOrienation
    @Environment(\.horizontalSizeClass) var horizontalOrienatation
    
    var body: some View {
        if horizontalOrienatation == .compact && verticalOrienation == .regular {
            verticalDesign
            
        } else {
            horizontalDesign
        }
        
    }
    @ViewBuilder
    private var horizontalDesign: some View {
        NavigationView{
            ScrollView{
                // VStack{
                ForEach(recycles,id: \.self) {recycle in
                    NavigationLink{
                        RecycleDetailView(recycle: recycle)
                    } label: {
                        CardView(image: recycle.image, title: recycle.title, stitle: recycle.stitle, desc: recycle.desc)
                            .padding(.horizontal,80)
                    }
                    
                    //}
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
                        .font(.body)
                        .foregroundColor(.thr)
                        .padding(5)
                }
                
                NavigationLink(destination: ListView()) {
                    Image(systemName: "list.clipboard")
                        .font(.body)
                        .foregroundColor(.thr)
                }
            }
            )
        }.padding(.horizontal, 50)
            .padding(.vertical, 5)
    }
    
    @ViewBuilder
    private var verticalDesign: some View {
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
                        .font(.body)
                        .padding(.top, 5)
                        .foregroundColor(.black)
                }
                
                NavigationLink(destination: ListView()) {
                    Image(systemName: "pencil.and.list.clipboard")
                        .font(.body)
                        .foregroundColor(.black)
                }
            }
            )//.padding(.horizontal, 5)
        }
    }
}

#Preview {
    RecycleView()
}
