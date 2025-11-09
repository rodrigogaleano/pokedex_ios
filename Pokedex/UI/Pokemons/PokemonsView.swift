//
//  HomeView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import SwiftUI

struct PokemonsView: View {
    @StateObject private var viewModel = PokemonsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    List{
                        ForEach(viewModel.pokemons, id: \.name) { pokemon in
                            NavigationLink(destination: PokemonDetailsView(name: pokemon.name)) {
                                ListItemView(imageURL: pokemon.imageURL, text: pokemon.name)
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
    PokemonsView()
}
