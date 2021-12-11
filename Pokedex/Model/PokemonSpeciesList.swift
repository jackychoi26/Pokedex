//
//  PokemonSpeciesList.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

struct PokemonSpeciesList: Codable {

    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonSpecies]
}
