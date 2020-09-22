//
//  LoginRequest.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Combine
struct LoginRequest {
    let email:String
    let password:String
    
    var publisher:AnyPublisher<User,AppError> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                
                if self.password == "password" {
                    let user = User.init(email: self.email, favoritePokemonIds: [])
                    promise(.success(user))
                }else {
                    promise(.failure(.passwordWrong))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        //不关心变形后的Publisher的具体类型，所以将他抹掉
        .eraseToAnyPublisher()
    }
}
 
 
