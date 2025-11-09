//
//  PaginationTriggerView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

import SwiftUI

struct PaginationTriggerView: View {
    let isLoading: Bool
    let onLoadMore: () -> Void
    
    var body: some View {
        if isLoading {
            ProgressView()
                .scaleEffect(0.8)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .center)
        } else {
            Color.clear
                .frame(height: 1)
                .onAppear {
                    onLoadMore()
                }
        }
    }
}

#Preview {
    PaginationTriggerView(isLoading: true, onLoadMore: {})
}
