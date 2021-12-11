//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

@MainActor
class PokemonListViewModel: ObservableObject {

    private let getPokemonSpeciesList: GetPokemonSpeciesList
    @Published private(set) var pokemons: [PokemonSpecies] = []

    init(getPokemonSpeciesList: GetPokemonSpeciesList = .init()) {
        self.getPokemonSpeciesList = getPokemonSpeciesList
    }

    func getPokemons(offset: Int = 0) async {
        let pokemonList = await getPokemonSpeciesList.execute(offset: offset)
        guard let pokemons = pokemonList?.results else { return }
        self.pokemons = pokemons
    }
}
