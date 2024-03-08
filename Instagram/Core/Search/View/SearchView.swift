//
//  SearchView.swift
//  Instagram
//
//  Created by John Strandt on 3/1/24.
//


import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                            ProfileView(user: user)
                            
                        } label: {
                            HStack {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.gray )
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                VStack (alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullName = user.fullName {
                                        Text(fullName)
                                    }
                                }
                                .font(.footnote)
                                
                                Spacer()
                            } // hstack
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            
                        }

                    }
                }
                .padding(.top, 8)
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search..."
                )
                // (displayMode: .always) not needed in iOS 15?
            
            } // scroll
            .navigationTitle("Explore")// only blue on this preview
            .navigationBarTitleDisplayMode(.inline)
            
        } // nav
        .navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}



