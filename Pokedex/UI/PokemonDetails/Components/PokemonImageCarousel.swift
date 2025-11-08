//
//  PokemonImageCarousel.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 31/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonImageCarousel: View {
    let frontImageURL: String
    let backImageURL: String
    
    var body: some View {
        TabView {
            WebImage(url: URL(string:frontImageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                    .scaleEffect(1.2)
            }
            .frame(width: 160, height: 160)
            .frame(maxWidth: .infinity, alignment: .center)
            WebImage(url: URL(string:  backImageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: -1, y: 1, anchor: .center)
            } placeholder: {
                ProgressView()
                    .scaleEffect(1.2)
            }
            .frame(width: 160, height: 160)
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(height: 260)
        .onAppear {
            setupTabViewIndicatorAppearance()
        }
    }
    
    private func setupTabViewIndicatorAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.label
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray4
    }
}

#Preview {
    PokemonImageCarousel(
        frontImageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/25.gif",
        backImageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/25.gif"
    )
}
