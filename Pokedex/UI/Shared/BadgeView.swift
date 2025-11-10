//
//  BadgeView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

import SwiftUI

struct BadgeView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .tertiarySystemFill))
            .clipShape(Capsule())
    }
}

#Preview {
    BadgeView(text: "Lorem Ipsum")
}
