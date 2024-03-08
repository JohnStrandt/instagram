//
//  ImagePickerView.swift
//  Instagram
//
//  Created by John Strandt on 3/5/24.
//

import SwiftUI
import FirebaseStorage      // images
import FirebaseFirestore    // database

// UploadPostView is trying to do this
struct ImagePickerView: View {
    
    // these two State variables are required
    @State var showPicker = false
    @State var selectedImage: UIImage?
    @State var retrievedImages = [UIImage]()
    
    var body: some View {

        VStack(spacing: 10) {
            
            if let selected = selectedImage {
                
                Image(uiImage: selected)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFill()
            }
            
            
            Button {
                showPicker = true
            } label: {
                Text("Select a Photo")
            }
            
            
            if selectedImage != nil {
                Button {
                    uploadPhoto()
                } label: {
                    Text("Upload Photo")
                }
            }
            
            Divider()
            
            HStack {

                // Loop through the images and display them
                ForEach(retrievedImages, id: \.self) { image in

                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
            
            
        }
        .sheet(isPresented: $showPicker, onDismiss: nil) {
            ImagePicker(selectedImage: $selectedImage, showPicker: $showPicker)
        }
        .onAppear {
            retrievePhotos()
        }
        
    }
    
    
    func uploadPhoto() {
        
        // make sure that the selected imaeg property isn't nil
        guard selectedImage != nil else {
            return
        }
        
        // create storage ref
        let storageRef = Storage.storage().reference()
        
        // turn image into data
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        // check that we were able to convert it to data
        guard imageData != nil else {
            return
        }
        
        // specify the file path and name
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        // upload data
        // leave the warning - underscore breaks it
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            // check for errors
            if error == nil && metadata != nil {
                
                // Save a reference to the file in Firestore DB
                let db = Firestore.firestore()
                db.collection("images").document().setData(["url":path]) { error in
                    
                    // if there were no errors, display the new image
                    if error == nil {

                        DispatchQueue.main.async {
                            // add the uploaded images to the list of images for display
                            self.retrievedImages.append(self.selectedImage!)
                        }
                    }
                }
            }// if no errors
            
        }
    }

    
    func retrievePhotos() {
        
        // get data from database
        let db = Firestore.firestore()
        
        
        db.collection("images").getDocuments { snapshot, error in
            
            if error == nil && snapshot != nil {
                
                var paths = [String]()
                
                // Loop through all the returned docs
                for doc in snapshot!.documents {
                    
                    // extract the file path and add to array
                    paths.append(doc["url"] as! String)
                }
                
                // Loop through each file path and fetch the data from storage
                for path in paths {
                    
                    // get a reference to storage
                    let storageRef = Storage.storage().reference()
                    
                    // Specify the path
                    let fileRef = storageRef.child(path)
                    
                    // Retrieve the data
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        
                        // check for errors
                        if error == nil && data != nil {
                            
                            // create a UIImage and put it into our array for display
                            if let image = UIImage(data: data!) {
                                
                                DispatchQueue.main.async {
                                    retrievedImages.append(image)
                                }
                            }
                        }
                    }
                }// end path loop
                
                
            }
        }
        
   
        // display the images
        
    }

}



struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
