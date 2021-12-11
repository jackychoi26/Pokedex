//
//  PokemonSpeciesDetail.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

import Foundation

struct PokemonSpeciesDetail: Codable, Hashable {

    let id: Int
    let names: [Names]
}

struct Names: Codable, Hashable {
    
    let language: Language
    let name: String
}

struct Language: Codable, Hashable {
    
    let name: String
    let url: String
}
