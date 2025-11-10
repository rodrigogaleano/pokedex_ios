//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import SwiftUI

struct PokemonDetailsView: View {
    let name: String
    @StateObject private var viewModel = PokemonDetailsViewModel()
    @State private var selectedTab: Tab = .info
    @State private var isShowingBack = false
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let pokemonDetails = viewModel.pokemonDetails {
                VStack(alignment: .leading, spacing: 20) {
                    if let frontURL = pokemonDetails.sprites.other?.showdown?.front_default,
                       let backURL = pokemonDetails.sprites.other?.showdown?.back_default {
                        PokemonImageCarousel(frontImageURL: frontURL, backImageURL: backURL)
                    }
                    HStack(spacing: 8) {
                        ForEach(pokemonDetails.types, id: \.info.name) { type in
                            BadgeView(text: type.info.name.capitalized)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .center)
                    Picker("Tab", selection: $selectedTab) {
                        ForEach(Tab.allCases) { tab in Text(tab.rawValue).tag(tab) }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                }
                VStack(alignment: .leading, spacing: 12) {
                    switch selectedTab {
                    case .info:
                        PokemonInfoTab(
                            bio: viewModel.pokemonBio,
                            height: pokemonDetails.height,
                            weight: pokemonDetails.weight
                        )
                    case .stats:
                        PokemonStatsTab(pokemonStats: pokemonDetails.stats)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            } else {
                ErrorView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle(name.capitalized)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getPokemonDetails(name: name)
        }
    }
    
    private enum Tab: String, CaseIterable, Identifiable {
        case info = "Info"
        case stats = "Stats"
        
        var id: String { rawValue }
    }
}

#Preview {
    PokemonDetailsView(name: "pikachu")
}

