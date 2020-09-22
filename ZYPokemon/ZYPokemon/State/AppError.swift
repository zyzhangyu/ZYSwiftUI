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
    case passwordWrong
}

///localizedDescription LocalizedError为错误添加本地化描述
extension AppError:LocalizedError {
    var localizedDescription: String {
        switch self {
        case .passwordWrong:
            return "密码错误"
        }
    }
}
