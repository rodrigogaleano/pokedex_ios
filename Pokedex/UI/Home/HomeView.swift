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
                                HStack(spacing: 12) {
                                    AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        ProgressView()
                                            .scaleEffect(0.5)
                                    }
                                    .frame(width: 50, height: 50)
                                    Text(pokemon.name.capitalized)
                                        .font(.body)
                                }
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
