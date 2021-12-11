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
        guard let pokemonList = await getPokemonList.execute(offset: offset) else { return }
        
        var pokemons: [Pokemon] = []
        
        pokemonList.forEach {
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

        self.pokemons += pokemons
    }
}
