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
                    List{
                        ForEach(viewModel.pokemons, id: \.name) { pokemon in
                            NavigationLink(destination: PokemonDetailsView(name: pokemon.name)) {
                                Text(pokemon.name.capitalized)
                            }
                        }
                        if viewModel.isLoadingMore {
                            ProgressView()
                                .scaleEffect(0.8)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            Color.clear
                                .frame(height: 1)
                                .onAppear {
                                    viewModel.loadMorePokemons()
                                }
                        }
                    }
                    
                }
            }
            .navigationTitle("Pokédex")
        }
        .onAppear {
            viewModel.getPokemons()
        }
    }
}


#Preview {
    HomeView()
}
