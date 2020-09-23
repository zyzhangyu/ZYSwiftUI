//
//  RegisterRequest.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/23.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import Combine


struct RegisterRequest {
    let email:String
    let password:String
    
    var publisher:AnyPublisher<User, AppError> {
        Future.init { (promise) in
            DispatchQueue.global().asyncAfter(deadline: .now()+1.5) {
                let r = Double.random(in: 0..<1)
                if r <= 0.5 {
                    let user = User.init(email: self.email, favoritePokemonIds: [])
                    promise(.success(user))
                }else {
                    promise(.failure(.aleradyRegistered))
                }
            }
        }
        .receive(on:DispatchQueue.main)
        .eraseToAnyPublisher()
        
    }
}
