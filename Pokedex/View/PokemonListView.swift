//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject private var viewModel = PokemonListViewModel()
    @State var pokemonOffset = 0
    
    private let columnSpacing: CGFloat = 10
    private let rowSpacing: CGFloat = 10
    
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 15) {
                ForEach((viewModel.pokemons), id: \.self) {
                    pokemon in
                    NavigationLink(destination: NavigationLazyView(PokemonDetailView(viewModel: PokemonDetailViewModel(id: pokemon.id, name: pokemon.nameTc, imageUrl: pokemon.imageUrl)))) {
                        PokemonView(name: pokemon.nameTc, imageUrl: pokemon.imageUrl)
                            .foregroundColor(.black)
                    }
                }
                
                ProgressView()
                    .frame(width: 80, height: 80, alignment: .center)
                    .onAppear {
                        Task {
                            pokemonOffset += 20
                            await viewModel.getPokemons(offset: pokemonOffset)
                        }
                    }
            }
            .task {
                await viewModel.getPokemons()
            }
        }
        .navigationBarHidden(true)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
