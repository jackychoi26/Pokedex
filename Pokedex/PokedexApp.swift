//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 27/11/2021.
//

import SwiftUI

@main
struct PokedexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
