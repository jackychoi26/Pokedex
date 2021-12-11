//
//  PokemonSpeciesListWebservice.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

struct PokemonSpeciesListWebservice {

    private let baseUrl: String
    private let limit: Int

    init(configuration: PokemonSpeciesListWebConfiguration = .init()) {
        baseUrl = configuration.baseUrl
        limit = configuration.limit
    }

    func performRequest(offset: Int) async throws -> PokemonSpeciesList {
        let urlString = baseUrl + "?offset=\(offset)&limit=\(limit)"
        guard let url = URL(string: urlString) else { throw WebserviceError.invalidUrl }
        let (data, _) = try await URLSession.shared.data(from: url)
        let pokemonList: PokemonSpeciesList = Bundle.main.decode(data)
        return pokemonList
    }
}
