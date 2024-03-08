//
//  Post.swift
//  Instagram
//
//  Created by John Strandt on 3/2/24.
//

import Foundation

// Identifiable: can be displayed in a list
// Hashable: make navigateable
// Codable: when we need to upload/download information to/from the server


struct Post: Identifiable, Hashable, Codable {
    var id: String // identifiable requires an id
    let ownerUID: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
    
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "At the Holiday Inn, Rome!",
            likes: 200,
            imageURL: "mick_1",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Me wedding day",
            likes: 40,
            imageURL: "keith_1",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "On the roof of Dairy Queen in Mexico",
            likes: 50,
            imageURL: "mick_2",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Hackney Diamonds show NY",
            likes: 53,
            imageURL: "keith_3",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "bowling night with Barney",
            likes: 86,
            imageURL: "fred_2",
            timestamp: Date(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Nice sunset",
            likes: 14,
            imageURL: "mick_3",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Rest in peace Richard",
            likes: 200,
            imageURL: "ron_2",
            timestamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Me and Keith at Jim Ryan's",
            likes: 100,
            imageURL: "mick_4",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Guitar Player got me again!",
            likes: 83,
            imageURL: "keith_4",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "it is I",
            likes: 200,
            imageURL: "ron_5",
            timestamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Martin stopped by",
            likes: 10,
            imageURL: "mick_5",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "On the cover of Uncut!",
            likes: 33,
            imageURL: "keith_2",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Oooh la la!",
            likes: 22,
            imageURL: "ron_1",
            timestamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Mick and I",
            likes: 122,
            imageURL: "ron_3",
            timestamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "Mick",
            likes: 133,
            imageURL: "ron_4",
            timestamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUID: NSUUID().uuidString,
            caption: "me and the ol bag",
            likes: 35,
            imageURL: "fred_1",
            timestamp: Date(),
            user: User.MOCK_USERS[3]
        )

    ]
}
