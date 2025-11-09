//
//  Item.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

struct Item: Decodable {
    let name: String
    let url: String
    
    var id: String {
        return url.split(separator: "/").last?.description ?? "1"
    }
    
    var imageURL: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/\(name).png"
    }
}
