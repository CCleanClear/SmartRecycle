//
//  NotesView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

import SwiftUI
import PencilKit
//import PhotosUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct EraserButton: View {
    @Binding var lines: [Line]
    
    var body: some View {
        Button(action: eraseAll) {
            Image(systemName: "eraser")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .clipShape(Circle())
        }
    }
    
    func eraseAll() {
        lines.removeAll()
    }
}

struct NotesView: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 1.0
    
    var body: some View {
        VStack {
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .frame(minWidth: 400, minHeight: 400)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    let newPoint = value.location
                    currentLine.points.append(newPoint)
                    self.lines.append(currentLine)
                })
                    .onEnded({ value in
                        self.lines.append(currentLine)
                        self.currentLine = Line(points: [], color: currentLine.color, lineWidth: thickness)
                    })
            )
            
            HStack {
                Slider(value: $thickness, in: 1...20) {
                    Text("Thickness")
                }
                .frame(maxWidth: 200)
                .onChange(of: thickness) { newThickness in
                    currentLine.lineWidth = newThickness
                }
                ColorPickerView(selectedColor: $currentLine.color)
                    .onChange(of: currentLine.color) { newColor in
                        currentLine.color = newColor
                    }
                EraserButton(lines: $lines)
            }
            .padding()
        }
    }
}
#Preview {
    NotesView()
}
