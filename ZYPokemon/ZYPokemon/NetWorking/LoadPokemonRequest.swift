//
//  LoadPokemonRequest.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/23.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Combine

struct LoadPokemonRequest {
    let id:Int
    func pokemonPublisher(_ id:Int) -> AnyPublisher<Pokemon, Error> {
        URLSession.shared
            .dataTaskPublisher(for: URL.init(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!)
            .map({$0.data})
            .decode(type: Pokemon.self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }
    
    func speciesPublisher(_ pokemon:Pokemon) -> AnyPublisher<(Pokemon, PokemonSpecies), Error> {
        URLSession.shared
            .dataTaskPublisher(for: pokemon.species.url)
            .map({$0.data})
            .decode(type: PokemonSpecies.self, decoder: appDecoder)
            .map({(pokemon,$0)})
            .eraseToAnyPublisher()
    }
    
    var publisher:AnyPublisher<PokemonViewModel, AppError> {
        pokemonPublisher(id)
            .flatMap({self.speciesPublisher($0)})
            .map({PokemonViewModel.init(pokemon: $0, species: $1)})
            .mapError({AppError.networkingFailed($0)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()        
    }
    
    static var all:AnyPublisher<[PokemonViewModel],AppError> {
        (1...30).map({
            LoadPokemonRequest.init(id: $0).publisher
        })
        .zipAll
    }
}
