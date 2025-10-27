//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading = false
    
    private let repository = PokemonRepository()
    
    func getPokemons() {
        isLoading = true
        
        Task {
            do {
                let response = try await repository.getPokemons()
                self.pokemons = response.pokemons
            } catch {
                print("Error fetching Pokemon: \(error)")
            }
            isLoading = false
        }
    }
}
