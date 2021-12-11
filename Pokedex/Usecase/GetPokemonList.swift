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
    
    func execute(offset: Int = 0) async -> [Pokemon] {
        let pokemonSpeciesList = await getPokemonSpeciesList.execute(offset: offset)
        
        let pokemonSpeciesDetails: [PokemonSpeciesDetail]? = try? await pokemonSpeciesList?.results.asyncMap {
                let url = URL(string: $0.url)!
                let (data, _) = try await URLSession.shared.data(from: url)
                let pokemons: PokemonSpeciesDetail = Bundle.main.decode(data)
                return pokemons
            }
        
        var pokemons: [Pokemon] = []
        
        pokemonSpeciesDetails?.forEach {
            pokemon in
            
            var nameEn: String = ""
            var nameTc: String = ""
            var nameSc: String = ""
            var nameJp: String = ""
            
            pokemon.names.forEach {
                let languageName = $0.language.name
                if languageName == "zh-Hant" {
                    nameTc = $0.name
                } else if languageName == "zh-Hans" {
                    nameSc = $0.name
                } else if languageName == "ja" {
                    nameJp = $0.name
                } else if languageName == "en" {
                    nameEn = $0.name
                }
            }
            
            let newPokemon = Pokemon(
                id: pokemon.id,
                nameEn: nameEn,
                nameTc: nameTc,
                nameSc: nameSc,
                nameJp: nameJp
            )
            
            pokemons.append(newPokemon)
        }

        return pokemons
    }
}
