//
//  LoadingView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 08/11/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
