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

    var body: some View {
        List {
            ForEach((viewModel.pokemons), id: \.self) {
                pokemon in
                Text("\(pokemon.name)")
            }

            Text("End")
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
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
