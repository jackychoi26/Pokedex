//
//  GetPokemonList.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

import Foundation

// Usecase to get the pokemon list
struct GetPokemonList {
    
    private let getPokemonSpeciesList: GetPokemonSpeciesList
    
    init(getPokemonSpeciesList: GetPokemonSpeciesList = .init()) {
        self.getPokemonSpeciesList = getPokemonSpeciesList
    }
    
    func execute(offset: Int = 0) async -> [PokemonSpeciesDetail]? {
        let pokemonSpeciesList = await getPokemonSpeciesList.execute(offset: offset)

        let pokemonList: [PokemonSpeciesDetail]? = try? await pokemonSpeciesList?.results.asyncMap {
            let url = URL(string: $0.url)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let pokemons: PokemonSpeciesDetail = Bundle.main.decode(data)
            return pokemons
        }

        return pokemonList
    }
}
