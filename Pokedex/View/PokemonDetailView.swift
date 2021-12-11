//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let viewModel: PokemonDetailViewModel
    @State private var isAnimating: Bool = false
    
    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 5) {
                AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .padding(.top, 40)
                
                
                Spacer()
            }
            .padding()
            
            HStack {
                Text("Hello World")
            }
            .padding(.top, -40)
            .background(Color.blue)
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(viewModel.name)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(viewModel: PokemonDetailViewModel(id: 1, name: "Pokemon", imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"))
    }
}
