//
//  PokemonView.swift
//  Pokedex
//
//  Created by Choi Kin Lung on 11/12/2021.
//

import SwiftUI

struct PokemonView: View {
    
    let name: String
    let imageUrl: String
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Text(name)
                        .font(.title2)
                        .padding()
                    
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                }
                Spacer()

            }
        }
        .background(Color.gray)
        .cornerRadius(12)
        .padding()
        
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(
            name: "Pokemon",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"
        )
    }
}
