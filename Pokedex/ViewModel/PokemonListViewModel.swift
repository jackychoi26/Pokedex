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
        let pokemons = await getPokemonList.execute(offset: offset)
        self.pokemons += pokemons
    }
}
