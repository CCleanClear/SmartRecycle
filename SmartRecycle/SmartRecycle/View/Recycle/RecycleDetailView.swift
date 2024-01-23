//
//  RecycleDetailView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 9/1/2024.
//

import SwiftUI

struct RecycleDetailView: View {
    var recycle : Recycle
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            verticalLayout
        } else {
            horizontalLayout
        }
    }
    
    @ViewBuilder
    private var horizontalLayout: some View {
        ScrollView{
            HStack {
                VStack (alignment: .leading, spacing: 5) {
                    Image(recycle.image).resizable().aspectRatio(contentMode: .fit)
                    //.padding(.horizontal, 10)
                }
                VStack{
                    HStack(spacing: 5){
                        VStack(alignment: .leading, spacing: 5){
                            Text(recycle.title).font(.title2)
                                .fontWeight(.bold)
                            Text(recycle.stitle).font(.headline).multilineTextAlignment(.leading)
                                .fontWeight(.bold).padding(.bottom)
                            Text(recycle.desc).font(.body).multilineTextAlignment(.leading)
                        }.padding()
                    }
                }.padding()
            }
        }
    }
    
    @ViewBuilder
    private var verticalLayout: some View {
        ScrollView{
            VStack{
                VStack (alignment: .leading) {
                    Image(recycle.image).resizable().aspectRatio(contentMode: .fit) .ignoresSafeArea(edges: .top)
                }
                HStack(spacing: 5){
                    VStack(alignment: .leading, spacing: 5){
                        Text(recycle.title).font(.title2)
                            .fontWeight(.bold)
                        Text(recycle.stitle).font(.headline).multilineTextAlignment(.leading)
                            .fontWeight(.bold).padding(.bottom)
                        Text(recycle.desc).font(.body).multilineTextAlignment(.leading)
                    }.padding()
                }
            }.padding()
        }
    }
}

#Preview {
    RecycleDetailView(recycle: recycles[6] )
}
