//
//  SearchViewModel.swift
//  Instagram
//
//  Created by John Strandt on 3/7/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    func fetchAllUsers() async throws {
        self.users = try await UserService().fetchAllUsers()
    }
}
// I made 2 changes:
// (1) original:  let users = try await UserService.fetchAllUsers()
// (2) original:  static func fetchAllUsers() async throws {


// note: dropping static got rid of Debug errors - did that break anything else?



