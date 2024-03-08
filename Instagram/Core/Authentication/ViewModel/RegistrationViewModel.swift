//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by John Strandt on 3/6/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        // reset form fields
        username = ""
        email = ""
        password = ""
    }
}
