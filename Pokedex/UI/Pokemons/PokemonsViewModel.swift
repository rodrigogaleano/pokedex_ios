//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import Foundation
import Combine

@MainActor
final class PokemonsViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading = false
    @Published var isLoadingMore = false
    
    private let repository = PokemonRepository()
    private var canLoadMore = true
    
    private var currentOffset: Int {
        return pokemons.count
    }
    
  
    func getPokemons() {
        isLoading = true
        
        Task {
            do {
                let response = try await repository.getPokemons()
                self.pokemons = response.pokemons
                self.canLoadMore = response.next != nil
            } catch {
                print("Error fetching Pokemon: \(error)")
            }
            isLoading = false
        }
    }
    
    func loadMorePokemons() {
        guard canLoadMore, !isLoadingMore else { return }
        
        isLoadingMore = true
        
        Task {
            do {
                let response = try await repository.getPokemons(offset: currentOffset)
                self.pokemons.append(contentsOf: response.pokemons)
                self.canLoadMore = response.next != nil
            } catch {
                print("Error loading more Pokemon: \(error)")
            }
            isLoadingMore = false
        }
    }
}
