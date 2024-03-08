//
//  UploadPostView.swift
//  Instagram
//
//  Created by John Strandt on 3/3/24.
//


import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption = ""
    @State var showPicker = false
    @State var selectedImage: UIImage?
    @Binding var tabIndex: Int
    // was tabIndex
    //    @StateObject var viewModel = UploadPostViewModel()

    
    
    var body: some View {
        
        VStack {
            // action toolbar
            HStack {
                Button {
                    caption = ""
                    showPicker = false
                    selectedImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // post image/caption
            HStack(spacing: 8) {
                
                
                
                if let selected = selectedImage {
                    
                    Image(uiImage: selected)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                
                
                // alternative to:
                // TextField with (axis: .vertical)
                ZStack{
                    TextEditor(text: $caption)
                        .frame(maxWidth: .infinity, maxHeight: 100)
                    
                    if caption.isEmpty {
                        VStack {
                            HStack {
                                Text("Enter your caption...")
                                    .foregroundStyle(.tertiary)
                                    .padding(.top, 40) // 8
                                    .padding(.leading, 5)
                                
                                Spacer()
                            }
                            Spacer()
                        }
                        .frame(maxHeight: 100)

                    }
                }
            }
            .padding()
            
            Spacer()
        
        }
        .onAppear{
            showPicker.toggle()
        }
        .sheet(isPresented: $showPicker, onDismiss: nil) {
            ImagePicker(selectedImage: $selectedImage, showPicker: $showPicker)
        }

        // .photoPicker() alternative
        
    }
}


struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
