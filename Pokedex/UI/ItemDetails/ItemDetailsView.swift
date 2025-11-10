//
//  ItemDetailsView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

import SwiftUI

struct ItemDetailsView: View {
    @StateObject private var viewModel = ItemDetailsViewModel()
    let name: String
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isLoading {
                LoadingView()
            } else if let itemDetails = viewModel.itemDetails {
                AsyncImage(url: URL(string: itemDetails.sprites.defaultSprite ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .scaleEffect(0.5)
                } .frame(width: 160, height: 160)
                BadgeView(text: itemDetails.category.name.capitalized)
                VStack(alignment: .leading, spacing: 16) {
                    Text(itemDetails.description ?? "")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(itemDetails.effects.first?.formattedEffect ?? "Unknown")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Short Effect: \(itemDetails.effects.first?.formattedShortEffect ?? "Unknown")")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            } else {
                ErrorView()
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle(name.capitalized)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getItemDetails(name: name)
        }
    }
}

#Preview {
    ItemDetailsView(name: "master-ball")
}
