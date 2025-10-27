//
//  Stat.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

struct PokemonStat: Decodable {
    let baseStat: Int
    let info: PokemonStatInfo
    
    private enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case info = "stat"
    }
}

struct PokemonStatInfo: Decodable {
    let name: String
}
