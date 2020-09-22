//
//  AppState.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct AppState {
    
    ///按照页面 将各自的状态组织到各自的名称下
    var settings = Settings()
}

extension AppState {
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        @SettingStorage(name: "showEnglishName")
        var showEnglishName
        var sorting = Sorting.id
        @SettingStorage(name: "isOnlyFavorite")
        var showFavoriteOnly
        
        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
                
        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser:User?
        
        var loginRequesting = false
        var loginError: AppError?
    }
}

 


