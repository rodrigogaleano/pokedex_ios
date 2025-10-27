//
//  HomeView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(viewModel.pokemons, id: \.name) { pokemon in
                        NavigationLink(destination: PokemonDetailsView(name: pokemon.name)) {
                            Text(pokemon.name.capitalized)
                        }
                    }
                }
            }
            .navigationTitle("Pokédex")
            .onAppear {
                viewModel.getPokemons()
            }
        }
    }
}

#Preview {
    HomeView()
}
