//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import SwiftUI

struct PokemonDetailsView: View {
    private var name: String
    @StateObject private var viewModel = PokemonDetailsViewModel()
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let pokemonDetails = viewModel.pokemonDetails {
                VStack {
                    Text("Height: \(pokemonDetails.height)")
                    Text("Weight: \(pokemonDetails.weight)")
                }
            } else {
                Text("Erro ao carregar Pokémon")
            }
        }
        .navigationTitle(name.capitalized)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getPokemonDetails(name: name)
        }
    }
}

#Preview {
    PokemonDetailsView(name: "pikachu")
}
