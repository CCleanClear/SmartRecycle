//
//  ColorPickerView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

//MARK: Source Code is based on YouTube "Creating Drawing App in SwiftUI" - https://www.youtube.com/watch?v=P0OdY9MVu_g&list=WL&index=16&t=754s

import SwiftUI

struct ColorPickerView: View {
    
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor : Color
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) {color in
                Image(systemName: selectedColor == color ?
                      Constants.Icons.recordCircleFill :
                        Constants.Icons.circleFill)
                .foregroundColor(color)
                .font(.system(size: 16))
                .clipShape(Circle())
                .onTapGesture {
                    selectedColor = color
                }
                
            }
        }
        
    }
}
