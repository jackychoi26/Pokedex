//
//  Bundle+decode.swift
//  Pokedex
//
//  Created by Jacky Choi Kin Lung on 7/12/2021.
//

import Foundation

extension Bundle {

    func decode<T: Codable>(_ data: Data) -> T {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode the data")
        }

        return decodedData
    }
}
