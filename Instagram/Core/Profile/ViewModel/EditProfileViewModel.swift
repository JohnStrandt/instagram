//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by John Strandt on 3/7/24.
//

import SwiftUI
import Firebase

// Same as UploadPostViewModel

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var profileImage: Image?  // was UIImage
    @Published var fullName = ""
    @Published var bio = ""
    
    init(user: User) {
        self.user = user
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        var data = [String: Any]()
        
        // update name if changed
        if !fullName.isEmpty && user.fullName != fullName {
            data["fullName"] = fullName
        }
        
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}
