//
//  PokemonListWebservice.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

struct PokemonListWebservice {

    private let url: URL?

    init(configuration: PokemonListWebConfiguration) {
        self.url = URL(string: configuration.url)
    }

    func performRequest() async throws -> PokemonList {
        guard let url = url else { throw WebserviceError.invalidUrl }
        let (data, _) = try await URLSession.shared.data(from: url)
        let pokemonList: PokemonList = Bundle.main.decode(data)
        return pokemonList
    }
}
