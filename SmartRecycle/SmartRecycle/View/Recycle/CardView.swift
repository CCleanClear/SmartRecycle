//
//  CardView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 9/1/2024.
//

//MARK: Source Code follow to Youtube "Simple CardView Screen Design in SwiftUI" https://www.youtube.com/watch?v=af1KHNuSCUA&list=WL&index=13

import SwiftUI

struct CardView: View {
    var image: String
    var title: String
    var stitle: String
    var desc: String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(stitle)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(desc)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                }.padding()
                Spacer()
            }
        }.cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.gray),lineWidth: 1))//.shadow(color: .black, radius: 8, x: 15, y: 7))
        .padding()
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 5, y: 10)
    }
}

//#Preview {
//    CardView(image: "Paper", title: "Metal", stitle: "Cleaning Recycling", desc: "Remove non-metal parts. Empty and rinse metal containers.")
//}
