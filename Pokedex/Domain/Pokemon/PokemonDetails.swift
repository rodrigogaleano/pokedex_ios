//
//  PokemonDetails.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

struct PokemonDetails: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let stats: [PokemonStat]
    let types: [PokemonType]
    let sprites: PokemonSprites
}
