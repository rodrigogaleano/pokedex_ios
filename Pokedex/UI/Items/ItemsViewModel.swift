//
//  ItemsViewModel.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

import Combine

@MainActor
final class ItemsViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var isLoading: Bool = false
    @Published var isLoadingMore: Bool = false
    
    private var canLoadMore = true
    private var currentOffset: Int { return items.count }
    
    
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
    
    func loadMoreItems() {
        guard canLoadMore, !isLoadingMore else { return }
        isLoadingMore = true
        Task {
            do {
                let response = try await itemRepository.getItems(offset: currentOffset)
                self.items.append(contentsOf: response.items)
                self.canLoadMore = response.next != nil
            } catch {
                print("Error loading more items: \(error)")
            }
        }
        isLoadingMore = false
    }
}
