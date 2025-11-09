//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PokemonsView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Pokémons")
                    }
                ItemsView()
                    .tabItem {
                        Image(systemName: "bag")
                        Text("Items")
                    }
            }
        }
    }
}
