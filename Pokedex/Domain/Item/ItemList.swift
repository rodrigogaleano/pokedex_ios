//
//  ItemList.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

struct ItemList: Decodable {
    let next: String?
    let items: [Item]
    
    private enum CodingKeys: String, CodingKey {
        case items = "results"
        case next
    }
}
