//
//  AppError.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

enum AppError:Error, Identifiable {
    

    
    var id : String {
        localizedDescription
    }
    
    case aleradyRegistered
    case passwordWrong
    case networkingFailed(Error)
}

///localizedDescription LocalizedError为错误添加本地化描述
extension AppError:LocalizedError {
    var localizedDescription: String {
        switch self {
        
        case .aleradyRegistered:
            return "该账号已注册"
        case .passwordWrong:
            return "密码错误"
        case .networkingFailed(let error):
            return error.localizedDescription
        }
    
    }
}
