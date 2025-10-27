//
//  PokemonType.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

struct PokemonType: Decodable {
    let info: PokemonTypeInfo
    
    private enum CodingKeys: String, CodingKey {
        case info = "type"
    }
    
}

struct PokemonTypeInfo: Decodable {
    let name: String
}
