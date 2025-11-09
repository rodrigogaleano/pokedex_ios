//
//  ItemsView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

import SwiftUI

struct ItemsView: View {
    @StateObject private var viewModel = ItemsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    List(viewModel.items, id: \.name) { item in
                        ListItemView(imageURL: item.imageURL, text: item.name)
                    }
                }
            }.navigationTitle("Items")
        }.onAppear {
            viewModel.getItems()
        }
    }
}

#Preview {
    ItemsView()
}
