//
//  PokemonListWebConfiguration.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

struct PokemonListWebConfiguration {

    private let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    private let limit = 20

    let url: String

    init(offset: Int) {
        let endpoint = "?limit=\(limit)&offset=\(offset)"
        url = baseUrl + endpoint
    }
}
