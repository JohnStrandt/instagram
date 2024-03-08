//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by John Strandt on 3/1/24.
//

import SwiftUI

struct CreateUsernameView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        
        SignupPrompt(
            prompt: "Add your username",
            info: "You'll use this name to sign in to your account.",
            placeholder: "Username",
            value: $viewModel.username,
            nextView: AnyView(CreatePasswordView())
        )
        
    }
}

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
