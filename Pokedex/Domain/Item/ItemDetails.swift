//
//  ItemDetails.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

import Foundation

struct ItemDetails: Decodable {
    let id: Int
    let name: String
    let sprites: ItemSprites
    let effects: [ItemEffect]
    let category: ItemCategory
    let flavorTextEntries: [ItemFlavorTextEntry]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
        case category
        case effects = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
    }
    
    var description: String? {
        guard let text = flavorTextEntries.first(where: { $0.language.name == "en" })?.text else { return nil }
        
        return text
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\u{000C}", with: " ")
            .replacingOccurrences(of: "  ", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

struct ItemFlavorTextEntry: Decodable {
    let text: String
    let language: Language
}
