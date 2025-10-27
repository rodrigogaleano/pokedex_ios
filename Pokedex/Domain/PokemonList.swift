//
//  PokemonList.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

struct PokemonList: Decodable {
    let next: String?
    let pokemons: [Pokemon]
    
    private enum CodingKeys: String, CodingKey {
        case pokemons = "results"
        case next
    }
}
