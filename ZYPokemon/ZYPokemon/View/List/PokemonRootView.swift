//
//  PokemonRootView.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct PokemonRootView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView {
            if store.appState.pokemonList.pokemons == nil {
                if store.appState.pokemonList.pokemonsLoadingError != nil {
                    RetryButton.init {
                        self.store.dispatch(.loadPokemons)
                    }
                }else {
                    Text("Loading...").onAppear {
                        self.store.dispatch(.loadPokemons)
                    }
                }
            }else {
                PokemonList().navigationBarTitle("宝可梦列表")
            }
        }
    }
    
    struct RetryButton:View {
        let block: () -> Void
        
        var body:some View {
            Button.init {
                self.block()
            } label: {
                HStack {
                    Image.init(systemName: "arrow.clockwise")
                    Text("重试")
                }
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
                .padding(6)
                .background(
                    RoundedRectangle.init(cornerRadius: 8)
                        .stroke(Color.gray)
                )
            }

        }
    }
}

struct PokemonRootView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRootView()
    }
}
