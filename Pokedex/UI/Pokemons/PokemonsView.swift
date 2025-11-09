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
                        PaginationTriggerView(isLoading: viewModel.isLoadingMore, onLoadMore: viewModel.loadMorePokemons)
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
