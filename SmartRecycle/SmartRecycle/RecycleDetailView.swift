//
//  RecycleDetailView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 9/1/2024.
//

import SwiftUI

struct RecycleDetailView: View {
    var recycle : Recycle
    var body: some View {
        VStack (alignment: .leading) {
                Image(recycle.image).resizable().aspectRatio(contentMode: .fit) .ignoresSafeArea(edges: .top)
        }
            HStack{
                VStack(alignment: .leading) {
                    Text(recycle.title).font(.title)
                        .fontWeight(.bold)
                    Text(recycle.stitle).font(.title)
                        .fontWeight(.bold)
                    Text(recycle.desc).foregroundColor(.secondary)
                }
            }
        }
    }

#Preview {
    RecycleDetailView(recycle: recycles[1] )
}
