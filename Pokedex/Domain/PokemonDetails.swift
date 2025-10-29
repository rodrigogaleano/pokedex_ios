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
    let sprites: Sprites
}

struct Sprites: Decodable {
    let front_default: String?
    let back_default: String?
    let other: Other?
    
    struct Other: Decodable {
        let showdown: Showdown?
        
        struct Showdown: Decodable {
            let front_default: String?
            let back_default: String?
        }
    }
}
