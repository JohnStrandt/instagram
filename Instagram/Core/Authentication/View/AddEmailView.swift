//
//  AddEmailView.swift
//  Instagram
//
//  Created by John Strandt on 3/1/24.
//

import SwiftUI

struct AddEmailView: View {

    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        
        SignupPrompt(
            prompt: "Add your email",
            info: "You'll use this email to sign in to your account.",
            placeholder: "Email",
            value: $viewModel.email,
            nextView: AnyView(CreateUsernameView())
        )

    }
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
