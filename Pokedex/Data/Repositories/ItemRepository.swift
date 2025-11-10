//
//  ItemRepository.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

struct ItemRepository {
    private let apiService: APIService = APIService()
    
    func getItems(offset: Int = 0, limit: Int = 20) async throws -> ItemList {
        let path = "/item?limit=\(limit)&offset=\(offset)"
        let response: ItemList = try await apiService.get(path: path)
        return response
    }
    
    func getItemDetails(name: String) async throws -> ItemDetails {
        let path = "/item/\(name)"
        let response: ItemDetails = try await apiService.get(path: path)
        return response
    }
}
