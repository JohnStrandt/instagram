//
//  FeedView.swift
//  Instagram
//
//  Created by John Strandt on 3/1/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 32) { // lazy used when fetching from database
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedCell(post: post)
                    }
                    
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Instagram_Logo")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            } // toolbar
            
        } // nav
        .navigationViewStyle(.stack)

    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
