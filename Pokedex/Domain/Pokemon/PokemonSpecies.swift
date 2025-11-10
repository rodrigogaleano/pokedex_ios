//
//  PokemonSpecies.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 30/10/25.
//

import Foundation

struct PokemonSpecies: Decodable {
    let flavorTextEntries: [PokemonFlavorTextEntry]
    
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
    
    var bio: String? {
        guard let flavorText = flavorTextEntries.first(where: { $0.language.name == "en" })?.flavorText else { return nil }
        
        return flavorText
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\u{000C}", with: " ")
            .replacingOccurrences(of: "  ", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

struct PokemonFlavorTextEntry: Decodable {
    let flavorText: String
    let language: Language
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}
