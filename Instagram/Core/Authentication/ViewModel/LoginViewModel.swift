//
//  LoginViewModel.swift
//  Instagram
//
//  Created by John Strandt on 3/6/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
       try await AuthService.shared.login(withEmail: email, password: password)
    }
}
