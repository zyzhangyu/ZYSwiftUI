//
//  PokemonList.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    
    @EnvironmentObject var store:Store
    @State var expandingIndex : Int?
    
    var body: some View {
        ScrollView {
            ForEach.init(store.appState.pokemonList.allPokemonByID) { pokemon in
                PokemonInfoRow.init(expanded: self.expandingIndex == pokemon.id, model: pokemon)
                .onTapGesture {
                        withAnimation(Animation.spring(response: 0.55, dampingFraction: 0.425, blendDuration: 0)) {
                            if self.expandingIndex == pokemon.id {
                                self.expandingIndex = nil
                            } else {
                                self.expandingIndex = pokemon.id
                            }
                        }
                    }
            }
        }
//        .overlay(
//            VStack {
//                Spacer()
//                PokemonInfoPanel.init(model: .sample(id: 1))
//            }.edgesIgnoringSafeArea(.bottom)
//        )
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
