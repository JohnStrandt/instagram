//
//  SignupPrompt.swift
//  Instagram
//
//  Created by John Strandt on 3/2/24.
//

import SwiftUI

struct SignupPrompt: View {
    @Environment(\.dismiss) var dismiss
    
    var prompt: String
    var info: String
    var placeholder: String
    @Binding var value: String
    var nextView: AnyView
    var secret: Bool = false
    

    var body: some View {
        
        VStack(spacing: 12) {
            
            Text(prompt)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(info)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            if (secret) {
                SecureField(placeholder, text: $value)
                    .autocapitalization(.none)
                    .modifier(IGTextfieldModifier())
                    .padding(.top)
            } else {
                TextField(placeholder, text: $value)
                    .autocapitalization(.none)
                    .modifier(IGTextfieldModifier())
                    .padding(.top)
            }

            NavigationLink {
                nextView
                    .navigationBarBackButtonHidden(true)
                
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
        } // vstack
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct SignupPrompt_Previews: PreviewProvider {
    static var previews: some View {
        SignupPrompt(
            prompt: "Add your email",
            info: "You'll use this email to sign in to your account.",
            placeholder: "Email",
            value: .constant("value"),
            nextView: AnyView(AddEmailView())
        )
    }
}
