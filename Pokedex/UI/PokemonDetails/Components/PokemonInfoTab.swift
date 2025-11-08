//
//  PokemonInfoTab.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 31/10/25.
//

import SwiftUI

struct PokemonInfoTab: View {
    let bio: String
    let height: Int
    let weight: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(bio)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(nil)
            VStack(alignment: .leading, spacing: 8) {
                Text("Height: \(height)")
                Text("Weight: \(weight)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    PokemonInfoTab(bio: "Lorem Ipsum", height: 20, weight: 40)
}
