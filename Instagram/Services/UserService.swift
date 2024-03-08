//
//  UserService.swift
//  Instagram
//
//  Created by John Strandt on 3/7/24.
//

import Foundation
import Firebase

struct UserService {
    
    @MainActor
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
