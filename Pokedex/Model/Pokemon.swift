//
//  Pokemon.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

import Foundation

struct Pokemon: Hashable {
    
    let id: Int
    let nameEn: String
    let nameTc: String
    let nameSc: String
    let nameJp: String
    
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}
