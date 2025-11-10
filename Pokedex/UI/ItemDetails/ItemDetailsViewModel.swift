//
//  ItemDetailsViewModel.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

import Combine

@MainActor
final class ItemDetailsViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var itemDetails: ItemDetails?
    
    private let repository = ItemRepository()
    
    func getItemDetails(name: String) {
        isLoading = true
        Task {
            do {
                let response = try await repository.getItemDetails(name: name)
                self.itemDetails = response
            } catch {
                print("Error loading item details: \(error)")
            }
        }
        isLoading = false
    }
}
