//
//  Stat.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

struct Stat: Decodable {
    let baseStat: Int
    let info: StatInfo
    
    private enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case info = "stat"
    }
}

struct StatInfo: Decodable {
    let name: String
}
