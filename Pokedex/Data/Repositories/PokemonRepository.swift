//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import Foundation

struct PokemonRepository {
    private let apiService: APIService = APIService()
    
    func getPokemons(offset: Int = 0, limit: Int = 20) async throws -> PokemonList {
        let path = "/pokemon?limit=\(limit)&offset=\(offset)"
        return try await apiService.get(path: path)
    }
    
    func getPokemonDetails(name: String) async throws -> PokemonDetails {
        let response: PokemonDetails = try await apiService.get(path: "/pokemon/\(name)")
        return response
    }
    
    func getPokemonSpecies(name: String) async throws -> PokemonSpecies {
        let response: PokemonSpecies = try await apiService.get(path: "/pokemon-species/\(name)")
        return response
    }
    
    func searchPokemon(name: String) async throws -> Pokemon {
        let response: PokemonDetails = try await apiService.get(path: "/pokemon/\(name.lowercased())")
        return Pokemon(name: response.name, url: "https://pokeapi.co/api/v2/pokemon/\(response.id)/")
    }
}
