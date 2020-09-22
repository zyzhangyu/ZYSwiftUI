//
//  PokemonSpecies.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Foundation
struct PokemonSpecies: Codable {
 
    struct Color: Codable {
        enum Name: String, Codable {
            case black, blue, brown, gray, green, pink, purple, red, white, yellow

            var color: SwiftUI.Color {
                print("pokemon-\(rawValue)")
                return SwiftUI.Color("pokemon-\(rawValue)")
            }
        }

        let name: Name
    }
    
    struct Name: Codable, LanguageTextEntry {
        let language: Language
        let name: String

        var text: String { name }
    }
    
    struct FlavorTextEntry: Codable, LanguageTextEntry {
        let language: Language
        let flavorText: String

        var text: String { flavorText }
    }
    
    struct Genus: Codable, LanguageTextEntry {
        let language: Language
        let genus: String

        var text: String { genus }
    }
    
    let color: Color
    let names: [Name]
    let genera: [Genus]
    let flavorTextEntries: [FlavorTextEntry]
}

 
