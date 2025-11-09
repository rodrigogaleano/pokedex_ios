//
//  ItemsViewModel.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

import Combine

final class ItemsViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var isLoading: Bool = false
    
    private let itemRepository = ItemRepository()
    
    func getItems() {
        isLoading = true
        Task {
            do {
                let response = try await itemRepository.getItems()
                self.items = response.items
            } catch {
                print("Error fetching items: \(error)")
            }
        }
        isLoading = false
    }
}
