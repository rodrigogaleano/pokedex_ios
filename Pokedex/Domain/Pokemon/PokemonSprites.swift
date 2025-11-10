//
//  PokemonSprites.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

struct PokemonSprites: Decodable {
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
