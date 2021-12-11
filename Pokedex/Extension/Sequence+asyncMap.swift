//
//  Sequence+asyncMap.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

extension Sequence {

    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
