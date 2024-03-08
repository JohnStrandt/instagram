//
//  ImagePicker.swift
//  Instagram
//
//  Created by John Strandt on 3/3/24.
//



import UIKit
import SwiftUI

// UIViewControllerRepresentable bridges UIKit Class and a SwiftUI project


struct ImagePicker:  UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var showPicker: Bool
 
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary // camera also available
        
        // Object that can recieve UIImagePickerController events (delegate)
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        // sets the context.coordinator
        return Coordinator(self)
    }
}



class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Allows ImagePicker Binding variables to be referenced from Coordinator using parent.variable
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // run this code when user has selected an image
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // update image on the main thread
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
        
        // dismiss picker
        parent.showPicker = false
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // run code when user cancels picker UI
        parent.showPicker = false
    }
}
