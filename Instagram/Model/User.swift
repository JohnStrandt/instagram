//
//  User.swift
//  Instagram
//
//  Created by John Strandt on 3/2/24.
//


import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    var username: String
    
    var fullName: String?
    var profileImageURL: String?
    var bio: String?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: NSUUID().uuidString,
            email: "mickjagger@stones.com",
            username: "mickjagger",
            fullName: "Mick Jagger",
            profileImageURL: "Mick",
            bio: "Rolling Stones"
            
        ),
        .init(
            id: NSUUID().uuidString,
            email: "keith@stones.com",
            username: "keithrichards",
            fullName: "Keith Richards",
            profileImageURL: "Keith",
            bio: "Rolling Stones"
            
        ),
        .init(
            id: NSUUID().uuidString,
            email: "ronnie@stones.com",
            username: "ronniewood",
            fullName: "Ron Wood",
            profileImageURL: "Ron",
            bio: "Rolling Stones"
            
        ),
        .init(
            id: NSUUID().uuidString,
            email: "fred@bedrock.com",
            username: "fredflintstone",
            fullName: "Fred Flintsone",
            profileImageURL: "Fred",
            bio: "Bedrock stoner"
        )
    ]
}
