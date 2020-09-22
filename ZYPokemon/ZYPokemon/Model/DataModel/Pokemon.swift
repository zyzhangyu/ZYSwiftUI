//
//  Pokemon.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Pokemon: Codable {
    ///类型
    struct `Type`:Codable {
        struct Internal:Codable {
            
            let name:String
            let url:URL
        }
        let slot:Int
        ///水系 火系这种
        let type:Internal
    }
    
    ///属性
    struct Stat: Codable {
        
        enum Case:String, Codable {
            case speed
            case speciaDefense = "special-defense"
            case speciaAttack = "special-attack"
            case defense
            case attack
            case hp
        }
        
        struct Internal:Codable {
            let name:Case
        }
        
        let baseStat:Int
        let stat:Internal
    }
    
    struct SpeciesEntry:Codable {
        let name:String
        let url:URL
    }
    
    struct AbilityEntry:Codable, Identifiable {
        struct Internal:Codable {
            let name:String
            let url:URL
        }
        
        var id:URL {ability.url}
        let slot:Int
        let ability:Internal
    }
    
    let id:Int
    let types:[Type]
    let abilities:[AbilityEntry]
    let stats:[Stat]
    let species:SpeciesEntry
    let height:Int
    let weight:Int
}

extension Pokemon:Identifiable{
    
}

extension Pokemon:CustomDebugStringConvertible {
    var debugDescription:String {
        "Pokemon - \(id) - \(self.species.name)"
    }
}
