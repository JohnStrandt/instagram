//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by John Strandt on 3/1/24.
//

import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        
        SignupPrompt(
            prompt: "Create a password",
            info: "Your password must be at least six characters long.",
            placeholder: "Password",
            value: $viewModel.password,
            nextView: AnyView(CompleteSignupView()),
            secret: true
        )
        
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
