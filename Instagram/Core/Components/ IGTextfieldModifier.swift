//
//   IGTextfieldModifier.swift
//  Instagram
//
//  Created by John Strandt on 3/1/24.
//

import SwiftUI


struct IGTextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}


