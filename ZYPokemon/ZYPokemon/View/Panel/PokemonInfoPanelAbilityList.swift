//
//  PokemonInfoPanelAbilityList.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

extension PokemonInfoPanel {
    struct AbilityList:View {
        let model:PokemonViewModel
        let abilityModels:[AbilityViewModel]?
        
        var body:some View {
            VStack(alignment: .leading, spacing: 12){
                Text("技能:")
                    .font(.headline)
                    .fontWeight(.bold)
                if abilityModels != nil {
                    ForEach(abilityModels!) {ability in
                        Text(ability.name)
                            .font(.footnote)
                            .foregroundColor(self.model.color)
                        Text(ability.descriptionText)
                            .font(.footnote)
                            .foregroundColor(Color.init(hex: 0xAAAAAA))
                        .fixedSize(horizontal: false, vertical: true)
                            
                    }
                    
                }
            }
            .frame(maxWidth:.infinity, alignment: .leading)
        }
    }
}
