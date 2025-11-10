//
//  ItemSprites.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

struct ItemSprites: Decodable {
   let defaultSprite: String?
   
   private enum CodingKeys: String, CodingKey {
       case defaultSprite = "default"
   }
}
