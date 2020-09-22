//
//  PokemonInfoPanel.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct PokemonInfoPanel: View {
    
    let model:PokemonViewModel
    
    var ablities:[AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle.init(cornerRadius: 3)
            .frame(width:40,height:6)
            .opacity(0.2)
    }
    
    var pokemonDescription:some View {
        Text(model.descriptionText)
            .font(.callout)
            .foregroundColor(Color.init(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true)
    }
        
    
    var body: some View {
        VStack{
            topIndicator
            Header.init(model: model)
            pokemonDescription
            Divider()
            AbilityList.init(model: model, abilityModels: ablities)
        }
        .padding(
            EdgeInsets.init(top: 12, leading: 30, bottom: 30, trailing: 30)
        )
        .blurBackground(style: .systemMaterial)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
        }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel.init(model: .sample(id: 1))
    }
}


    

