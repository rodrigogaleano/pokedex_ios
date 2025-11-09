//
//  ItemRepository.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

struct ItemRepository {
    private let apiService: APIService = APIService()
    
    func getItems() async throws -> ItemList {
        let response: ItemList = try await apiService.get(path: "/item")
        return response
    }
}
