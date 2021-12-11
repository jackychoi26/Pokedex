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
    let flavorText: String = "背上的種子裡存著很多營養，\n所以就算好幾天不吃東西\n也能活得好好的！"
}
