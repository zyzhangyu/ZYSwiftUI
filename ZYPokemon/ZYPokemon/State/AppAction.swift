//
//  AppAction.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

enum AppAction {
    case login(email:String, password:String)
    case accountBehaviorDone(result:Result<User, AppError>)
    case logout
}

 
