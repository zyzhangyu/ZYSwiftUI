//
//  User.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct User: Codable {
    
    var email:String
    
    var favoritePokemonIds:Set<Int>
    
    func isFavoritePokemon(id:Int) -> Bool {
        favoritePokemonIds.contains(id)
    }
}

 
