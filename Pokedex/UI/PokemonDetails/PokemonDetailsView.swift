//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Rodrigo Galeano on 26/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailsView: View {
    private var name: String
    @StateObject private var viewModel = PokemonDetailsViewModel()
    @State private var selectedTab: Tab = .info
    @State private var isShowingBack = false
    
    private enum Tab: String, CaseIterable, Identifiable {
        case info = "Info"
        case stats = "Stats"
        
        var id: String { rawValue }
    }
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let pokemonDetails = viewModel.pokemonDetails {
                VStack(alignment: .leading, spacing: 20) {
                    if let frontURL = pokemonDetails.sprites.other?.showdown?.front_default,
                       let backURL = pokemonDetails.sprites.other?.showdown?.back_default {
                        
                        WebImage(url: URL(string: isShowingBack ? backURL : frontURL)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                                .scaleEffect(1.2)
                        }
                        .frame(width: 200, height: 200)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    let threshold: CGFloat = 50
                                    if abs(value.translation.width) > threshold {
                                        withAnimation(.easeInOut(duration: 0.6)) {
                                            isShowingBack.toggle()
                                        }
                                    }
                                }
                        )
                    }
                    HStack(spacing: 8) {
                        ForEach(pokemonDetails.types, id: \.info.name) { type in
                            Text(type.info.name.capitalized)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(uiColor: .tertiarySystemFill))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .center)
                    Picker("Tab", selection: $selectedTab) {
                        ForEach(Tab.allCases) { tab in
                            Text(tab.rawValue).tag(tab)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                }
                VStack(alignment: .leading, spacing: 12) {
                    switch selectedTab {
                    case .info:
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Height: \(pokemonDetails.height)")
                            Text("Weight: \(pokemonDetails.weight)")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 8)
                        
                    case .stats:
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(pokemonDetails.stats, id: \.info.name) { stat in
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
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
            } else {
                Text("Something went wrong")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle(name.capitalized)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getPokemonDetails(name: name)
        }
    }
}

#Preview {
    PokemonDetailsView(name: "pikachu")
}
