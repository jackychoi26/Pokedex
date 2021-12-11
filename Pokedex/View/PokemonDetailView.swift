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
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor.white
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    //    AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
    //        image.resizable()
    //    } placeholder: {
    //        ProgressView()
    //    }
    //    .zIndex(1)
    //    .frame(width: 200, height: 200)

    var body: some View {
        ScrollView {
            ZStack {
                AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .zIndex(1)
                .frame(width: 200, height: 200)

                .offset(y: -130)

                VStack {
                    HStack {
                        Spacer()
                    }
                    .frame(width: .infinity, height: 150)
                    .background(Color.white)
                    .zIndex(-1)

                    VStack {
                        HStack(alignment: .center) {
                            Spacer()
                            VStack(alignment: .leading, spacing: 20) {
                                Text("體重：6.9 KG")
                                Text("身高：70 CM")
                                Text("屬性：草系 毒系")
                                Text("生長速度：中至慢")
                                Text("居住地：草地")
                                Text(viewModel.flavorText)
                            }
                            Spacer()
                        }
                        .padding(.top, 120)
                    }
                    .background(Color.gray.clipShape(CustomShape()))
                    .padding(.top, -40)
                    .zIndex(-1)
                }
            }
        }
        .background(Color.gray)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(viewModel.name)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(viewModel: PokemonDetailViewModel(id: 1, name: "Pokemon", imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"))
            .previewDevice("iPhone 13")
    }
}
