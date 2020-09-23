//
//  AppState.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Combine
struct AppState {
    
    ///按照页面 将各自的状态组织到各自的名称下
    var settings = Settings()
    var pokemonList = PokemonList()

}


extension AppState {
    struct PokemonList {
        
        //用来持有网络请求过程中产生的错误
        var pokemonsLoadingError:AppError?
        
        @FileStorage(directory: .cachesDirectory, fileName: "pokemons.json")
        var pokemons:[Int: PokemonViewModel]?
        
        var loadingPokemons = false
        
        var allPokemonByID:[PokemonViewModel] {
            guard let pokemons = pokemons?.values else {
                return []
            }
            return pokemons.sorted{$0.id > $1.id}
        }
    }
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
        
//        var accountBehavior = AccountBehavior.login
//        var email = ""
//        var password = ""
//        var verifyPassword = ""
                
        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser:User?
        
        var loginRequesting = false
        var loginError: AppError?
        
        class AccountChecker {
            @Published var accountBehavior = AccountBehavior.login
            @Published var email = ""
            @Published var password = ""
            @Published var verifyPassword = ""
            
            var isValid:AnyPublisher<Bool,Never> {
                isEmailValid
                    .combineLatest($accountBehavior, $password, $verifyPassword)
                    .map({validEmail, accountBehavior, password, verifyPassword -> Bool in
                        guard validEmail && !password.isEmpty else {
                            return false
                        }
                        switch accountBehavior {
                        case .login:
                            return true
                        case .register:
                            return password == verifyPassword
                        }
                    })
                    .eraseToAnyPublisher()
            }
            
            
            ///验证用户输入的Publisher
            var isEmailValid:AnyPublisher<Bool,Never> {
                //调用Server API来验证有效性
                let remoteVerify = $email
                    //防抖
                    .debounce(
                        for: .milliseconds(500),
                        scheduler: DispatchQueue.main
                    )
                    //重复输入
                    .removeDuplicates()
                    .flatMap { email -> AnyPublisher<Bool, Never> in
                        let validEmail = email.isValidEmailAddress
                        let canSkip = self.accountBehavior == .login
                        switch (validEmail, canSkip) {
                        
                        case (false, _):
                            return Just(false).eraseToAnyPublisher()
                        case (true, false):
                            return EmailCheckingRequest(email: email)
                                .publisher
                                .eraseToAnyPublisher()
                        case (true, true):
                            return Just(true).eraseToAnyPublisher()
                        }
                    }
                
                let emailLocalValid = $email.map { $0.isValidEmailAddress }
                let canSkipRemoteVerify = $accountBehavior.map { $0 == .login }
                
                return Publishers.CombineLatest3(
                    emailLocalValid, canSkipRemoteVerify, remoteVerify
                )
                .map { $0 && ($1 || $2) }
                .eraseToAnyPublisher()
            }
        }
        
        var checker = AccountChecker()
        var isEmailValid: Bool = false
        var isValid:Bool = false
    }
    

}

 


