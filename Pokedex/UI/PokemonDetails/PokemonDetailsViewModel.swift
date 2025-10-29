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
    @Published var pokemonDetails : PokemonDetails?
    
    private let repository = PokemonRepository()
    
    func getPokemonDetails(name: String) {
        isLoading = true
        
        Task {
            do {
                let response = try await repository.getPokemonDetails(name: name)
                self.pokemonDetails = response
            } catch {
                self.pokemonDetails = nil
            }
            self.isLoading = false
        }
    }
}
