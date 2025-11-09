//
//  ListItemView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

import SwiftUI

struct ListItemView: View {
    let imageURL: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .scaleEffect(0.5)
            }
            .frame(width: 50, height: 50)
            Text(text.capitalized)
                .font(.body)
        }
    }
}

#Preview {
    ListItemView(imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png", text: "Lorem Ipsum"
    )
}
