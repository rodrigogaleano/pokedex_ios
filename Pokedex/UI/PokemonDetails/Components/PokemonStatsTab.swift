//
//  PokemonStatsTab.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 31/10/25.
//

import SwiftUI

struct PokemonStatsTab: View {
    let pokemonStats: [PokemonStat]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(pokemonStats, id: \.info.name) { stat in
                HStack(alignment: .center, spacing: 8) {
                    Text("\(stat.info.name.capitalized): \(stat.baseStat)")
                    Spacer()
                    ProgressView(value: Float(stat.baseStat), total: 255)
                        .frame(width: 180)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    PokemonStatsTab(pokemonStats: [
        PokemonStat(baseStat: 35, info: PokemonStatInfo(name: "hp")),
        PokemonStat(baseStat: 55, info: PokemonStatInfo(name: "attack")),
        PokemonStat(baseStat: 40, info: PokemonStatInfo(name: "defense")),
        PokemonStat(baseStat: 50, info: PokemonStatInfo(name: "special-attack")),
        PokemonStat(baseStat: 50, info: PokemonStatInfo(name: "special-defense")),
        PokemonStat(baseStat: 90, info: PokemonStatInfo(name: "speed"))
    ])
}
