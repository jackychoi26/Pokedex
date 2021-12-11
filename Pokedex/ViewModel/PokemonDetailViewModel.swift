//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    init(id: Int, name: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }

    let id: Int
    let name: String
    let imageUrl: String
}
