//
//  ErrorView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 09/11/25.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("Something went wrong")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    ErrorView()
}
