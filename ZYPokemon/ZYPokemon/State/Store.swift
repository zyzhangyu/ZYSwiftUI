//
//  Store.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Combine

///ObservableObject 我们可以在View里通过@ObservedObject 或者 @EnvironmentObject访问
class Store: ObservableObject {
    
    init() {
        setupObservers()
    }
    
    @Published var appState = AppState()
    
    var disposeBag = [AnyCancellable]()
    func setupObservers(){
        
        appState.settings.checker.isValid.sink{isValid in
            self.dispatch(.accountBehaviorButton(enable: isValid))
        }.store(in: &disposeBag)
        
        appState.settings.checker.isEmailValid.sink { isValid in
            self.dispatch(.emailValid(valid: isValid))
        }.store(in: &disposeBag)
    }
    
    func dispatch(_ action:AppAction) {
        #if DEBUG
        print("[ACTION]:\(action)")
        #endif
            
    
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            #if DEBUG
                print("[COMMAND]:\(command)")
            #endif
            command.execute(in: self)
        }
    }
    
    static func reduce(state:AppState, action:AppAction) -> (AppState,AppCommand?) {
        var appState = state
        var appCommand:AppCommand?
        switch action {
        case .clearCache:
            appState.pokemonList.pokemons = nil
            //这里的属性json文件没有删除
            appCommand = ClearCacheCommand()

        
        case .register(let email, let password):
            appState.settings.loginRequesting = true
            appCommand = RegisterAppCommand.init(email: email, password: password)
        
        case .accountBehaviorButton(let isValid):
            appState.settings.isValid = isValid
        
        case .loadPokemons:
            if appState.pokemonList.loadingPokemons {
                break
            }
            appState.pokemonList.loadingPokemons = true
            appCommand = LoadPokemonsCommand()
        case .loadPokemonDone(let result):
            switch result {
            case .success(let models):
                appState.pokemonList.pokemons = Dictionary.init(uniqueKeysWithValues: models.map{($0.id, $0)})
            case .failure(let error):
                print(error)
            }
        case .emailValid(let valid):
            appState.settings.isEmailValid = valid
        case .logout:
            appState.settings.loginRequesting = false
            appState.settings.loginUser = nil
            appState.settings.checker.password = ""
            break
        case .login(let email,let password):
            ///loginRequesting 是false才能继续
            guard !appState.settings.loginRequesting else {
                break
            }
            appState.settings.loginRequesting = true
            appCommand = LoginAppCommand.init(email: email, password: password)
        case .accountBehaviorDone(let result):
            appState.settings.loginRequesting = false
            switch result {
            case .success(let user):
                appState.settings.loginUser = user
            case .failure(let error):
                print("Error: \(error)")
                appState.settings.loginError = error
            }
        }
        
        
        
        return (appState, appCommand)
    }
}
 

struct Store_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
