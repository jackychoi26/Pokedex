//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

@MainActor
class PokemonListViewModel: ObservableObject {

    private let getPokemonList: GetPokemonList
    @Published private(set) var pokemons: [Pokemon] = []

    init(getPokemonList: GetPokemonList = .init()) {
        self.getPokemonList = getPokemonList
    }

    func getPokemons(offset: Int = 0) async {
        let pokemonList = await getPokemonList.execute()
        guard let pokemons = pokemonList?.results else { return }
        self.pokemons = pokemons
    }

    func getMorePokemons(offset: Int) async {
        let pokemonList = await getPokemonList.execute(offset: offset)
        guard let pokemons = pokemonList?.results else { return }
        self.pokemons += pokemons
    }
}
