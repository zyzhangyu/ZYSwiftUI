//
//  AppAction.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

enum AppAction {
    
    //验证注册或登录按钮是否可点
    case accountBehaviorButton(enable:Bool)
    case accountBehaviorDone(result:Result<User, AppError>)
    //注册
    case register(email:String, password:String)
    //邮箱输入
    case emailValid(valid:Bool)

    
    case login(email:String, password:String)
    case logout
    case loadPokemons
    case loadPokemonDone(result:Result<[PokemonViewModel], AppError>)
    //清空缓存
    case clearCache

    
}

