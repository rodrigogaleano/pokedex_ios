//
//  ItemEffect.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

import Foundation

struct ItemEffect: Decodable {
    let effect: String
    let shortEffect: String
    
    private enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
    }
    
    var formattedEffect: String {
        return effect
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\u{000C}", with: " ")
            .replacingOccurrences(of: "    ", with: " ")
            .replacingOccurrences(of: "  ", with: " ")
            .replacingOccurrences(of: " :", with: ":")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var formattedShortEffect: String {
        return shortEffect
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\u{000C}", with: " ")
            .replacingOccurrences(of: "    ", with: " ")
            .replacingOccurrences(of: "  ", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
