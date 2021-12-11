//
//  GetPokemonSpeciesList.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

// Usecase to get the pokemon species list
struct GetPokemonSpeciesList {

    private let pokemonSpeciesListWebservice: PokemonSpeciesListWebservice

    init(pokemonSpeciesListWebservice: PokemonSpeciesListWebservice = .init()) {
        self.pokemonSpeciesListWebservice = pokemonSpeciesListWebservice
    }

    func execute(offset: Int = 0) async -> PokemonSpeciesList? {
        try? await pokemonSpeciesListWebservice.performRequest(offset: offset)
    }
}
