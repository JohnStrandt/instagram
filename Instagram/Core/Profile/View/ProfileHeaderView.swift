//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by John Strandt on 3/2/24.
//


import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile = false
    
    
    var body: some View {

        VStack (spacing: 10){

            HStack {
                Image(user.profileImageURL ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack (spacing: 8) {
                    
                    UserStatView(value: 513, title: "Posts")
                    UserStatView(value: 3_200_000, title: "Followers")
                    UserStatView(value: 75, title: "Following")
                    
                }
            }
            .padding(.horizontal)
            
            VStack (alignment: .leading, spacing: 4) {
                
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                    
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow \(user.username)")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1))
            }

            Divider()
            
        }
        .fullScreenCover(isPresented: $showEditProfile) {

            EditProfileView(user: user)
        }
        
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
