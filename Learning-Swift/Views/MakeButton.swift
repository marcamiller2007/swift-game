//
//  MakeButton.swift
//  Learning-Swift
//
//  Created by Marc Miller on 12/20/25.
//

import SwiftUI

struct MakeButton: ViewModifier {
    func body(content: Content) -> some View {
        HStack (spacing: 0) {
            Image(systemName: "button.programmable")
            content
                .padding(.horizontal, 10)
        }
        .padding(5)
        .font(.title3)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 2)
        )
        .foregroundColor(.blue)
        .padding(10)
    }
}

extension View {
    func makeButton() -> some View {
        modifier(MakeButton())
    }
}
