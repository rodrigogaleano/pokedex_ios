//
//  Pokemon.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

struct Pokemon: Decodable {
    let name: String
    let url: String
    
    var id: String {
        return url.split(separator: "/").last?.description ?? "1"
    }
    
    var imageURL: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}
