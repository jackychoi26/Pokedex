//
//  NavigationLazyView.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
