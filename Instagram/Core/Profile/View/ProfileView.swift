//
//  ProfileView.swift
//  Instagram
//
//  Created by John Strandt on 2/28/24.
//


import SwiftUI

struct ProfileView: View {
    
    let user: User
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    
    var body: some View {
            
        NavigationView {
        ScrollView {
            
            ProfileHeaderView(user: user)
                
            PostGridView(posts: posts)

            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
        } // nav
        .navigationViewStyle(.stack)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
