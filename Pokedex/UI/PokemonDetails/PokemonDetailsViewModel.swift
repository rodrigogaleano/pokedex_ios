//
//  PokemonDetailsViewModel.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import Foundation
import Combine

@MainActor
final class PokemonDetailsViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var pokemonBio: String = ""
    @Published var pokemonDetails: PokemonDetails?
    
    private let repository = PokemonRepository()
    
    func getPokemonDetails(name: String) {
        isLoading = true
        
        Task {
            do {
                async let detailsResponse = repository.getPokemonDetails(name: name)
                async let speciesResponse = repository.getPokemonSpecies(name: name)
                
                let details = try await detailsResponse
                let species = try await speciesResponse
                
                self.pokemonDetails = details
                self.pokemonBio = species.bio ?? "No biography available."
            } catch {
                print("Error loading pokemon: \(error)")
            }
            self.isLoading = false
        }
    }
}
