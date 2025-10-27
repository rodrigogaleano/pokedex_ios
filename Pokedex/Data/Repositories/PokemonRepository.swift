//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import Foundation

struct PokemonRepository {
    private let apiService: APIService = APIService()
    
    func getPokemons() async throws -> PokemonList {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        let response: PokemonList = try await apiService.get(from: url)
        return response
    }
    
    func getPokemonDetails(name: String) async throws -> PokemonDetails {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)")!
        let response: PokemonDetails = try await apiService.get(from: url)
        return response
    }
}
