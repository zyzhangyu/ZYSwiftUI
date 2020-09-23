//
//  EmailCheckingRequest.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/23.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Combine
struct EmailCheckingRequest {
    let email:String
    var publisher:AnyPublisher<Bool, Never> {
        Future<Bool, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                if self.email.lowercased() == "zylike@hotmail.com" {
                    promise(.success(true))
                } else {
                    promise(.success(false))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
