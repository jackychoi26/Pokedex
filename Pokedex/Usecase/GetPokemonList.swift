//
//  GetPokemonList.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

struct GetPokemonList {

    private let pokemonListWebservice: PokemonListWebservice

    init(pokemonListWebservice: PokemonListWebservice = .init(configuration: PokemonListWebConfiguration(offset: 0))) {
        self.pokemonListWebservice = pokemonListWebservice
    }

    func execute(offset: Int = 0) async -> PokemonList? {
        let pokemonList = try? await PokemonListWebservice(configuration: .init(offset: offset)).performRequest()
        return pokemonList
    }
}
