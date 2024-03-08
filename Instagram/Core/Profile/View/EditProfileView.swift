//
//  EditProfileView.swift
//  Instagram
//
//  Created by John Strandt on 3/7/24.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var showPicker = false
    @State var selectedImage: UIImage?
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
//    @Published var profileImage: UIImage?     // SwiftUI Image
//
//    @State private var fullname = ""
//    @State private var bio = ""
     
    
    
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task { try await viewModel.updateUserData() }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal    )
                
                
                Divider()
            }

            
            Button {
                showPicker.toggle()
            } label: {
                
                VStack {
                    if let profileImage = selectedImage {
                       Image(uiImage: profileImage)
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                        
                    } else {
                        
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            } // label
            
            // check image format... some Cartmans did not work
            
            
            Divider()
            
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullName)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }
            
            Spacer()
            
        }
        .sheet(isPresented: $showPicker, onDismiss: loadImage) { // onDismiss: nil
            ImagePicker(selectedImage: $selectedImage, showPicker: $showPicker)
        }
        
    }
    

    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        viewModel.profileImage =  Image(uiImage: selectedImage)
    }
    
}




struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
       
        HStack {
            Text (title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
        
    }
}
 

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
