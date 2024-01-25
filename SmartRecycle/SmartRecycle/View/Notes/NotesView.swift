//
//  NotesView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 8/1/2024.
//

//MARK: Source Code follow to Youtube "Creating Drawing App in SwiftUI" https://www.youtube.com/watch?v=P0OdY9MVu_g&list=WL&index=16&t=754s

import SwiftUI
import PencilKit

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
                .background(Color.accentColor)
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
    
    @Environment(\.verticalSizeClass) var verticalOrientation
    @Environment(\.horizontalSizeClass) var horizontalOrientation
    
    var body: some View {
        
        if horizontalOrientation == .compact && verticalOrientation == .regular {
            verticalDesign
        } else {
            horizontalDesign
        }
        
    }
    
    @ViewBuilder
    private var horizontalDesign: some View {
        
        VStack {
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .frame(minWidth: 400, minHeight: 300)
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
            
            HStack ( spacing: 13) {
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
                    .padding(.bottom, 10)
            }
        }
    }
    
    @ViewBuilder
    private var verticalDesign: some View {
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
