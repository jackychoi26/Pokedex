//
//  GetPokemonSpeciesList.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

struct GetPokemonSpeciesList {

    private let pokemonSpeciesListWebservice: PokemonSpeciesListWebservice

    init(pokemonSpeciesListWebservice: PokemonSpeciesListWebservice = .init()) {
        self.pokemonSpeciesListWebservice = pokemonSpeciesListWebservice
    }

    func execute(offset: Int = 0) async -> PokemonSpeciesList? {
        let pokemonList = try? await pokemonSpeciesListWebservice.performRequest(offset: offset)
        return pokemonList
    }
}
