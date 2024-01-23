//
//  PlasticClassificationView.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 12/1/2024.
//

import SwiftUI

struct PlasticClassificationView: View {
    @State private var isPresented = false
    @State private var sourceType = UIImagePickerController.SourceType.photoLibrary
    @State private var image: UIImage?
    
    
    @ObservedObject var classification = ImageClassification()
    
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
        HStack (alignment:.top, spacing: 10){
            VStack {
                Text("Plastic Type Classification")
                    .font(.title).bold()
                    .fixedSize(horizontal: true, vertical: false)
                
            } .padding(.top, 10)
            
            VStack{
                ZStack(alignment: .center) {
                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                        //.edgesIgnoringSafeArea(.all)
                    }
                    else {
                        Image(uiImage: UIImage())
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    VStack {
                        // display the classification result
                        Text(classification.classificationLabel)
                            .padding(20)
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 10).stroke(Color(.black),lineWidth: 2)
                                    .background(Color.white).cornerRadius(9)
                            )
                        
                        // select camera or photo library
                        Menu {
                            Button(action: {
                                self.isPresented.toggle()
                                self.sourceType = .camera
                            }, label: {
                                Text("Take Photo")
                            })
                            
                            Button(action: {
                                self.isPresented.toggle()
                                self.sourceType = .photoLibrary
                            }, label: {
                                Text("Choose Photo")
                            })
                        } label: {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .padding(10)
                        }
                        .sheet(isPresented: $isPresented, onDismiss: {
                            // Classify image
                            if let image = self.image {
                                classification.updateClassifications(for: image)
                            }
                        }, content: {
                            ImagePicker(sourceType: self.sourceType, image: $image)
                        })
                    }
                }
            }
        }
        
    }
    
    @ViewBuilder
    private var verticalLayout: some View {
        VStack (alignment: .leading, spacing: 10){
            Text("Plastic Type Classification")
                .font(.title).bold()
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
        ZStack(alignment: .bottom) {
            if let image = self.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            else {
                Image(uiImage: UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            
            VStack {
                Text(classification.classificationLabel)
                    .padding(20)
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 10).stroke(Color(.black),lineWidth: 2)
                            .background(Color.white).cornerRadius(9)
                    )
                
                // select camera or photo library
                Menu {
                    Button(action: {
                        self.isPresented.toggle()
                        self.sourceType = .camera
                    }, label: {
                        Text("Take Photo")
                    })
                    
                    Button(action: {
                        self.isPresented.toggle()
                        self.sourceType = .photoLibrary
                    }, label: {
                        Text("Choose Photo")
                    })
                } label: {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(20)
                }
                .sheet(isPresented: $isPresented, onDismiss: {
                    // Classify the image
                    if let image = self.image {
                        classification.updateClassifications(for: image)
                    }
                }, content: {
                    ImagePicker(sourceType: self.sourceType, image: $image)
                })
            }
        }
    }
    
    // MARK: - ImagePicker
    struct ImagePicker: UIViewControllerRepresentable {
        var sourceType: UIImagePickerController.SourceType = .photoLibrary
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = sourceType
            imagePicker.delegate = context.coordinator
            return imagePicker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            
        }
        
        // MARK: - Using Coordinator to Adopt the  UIImagePickerControllerDelegate Protocol
        @Binding var image: UIImage?
        @Environment(\.presentationMode) private var presentationMode
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            var parent: ImagePicker
            
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    parent.image = image
                }
                
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    PlasticClassificationView()
}
