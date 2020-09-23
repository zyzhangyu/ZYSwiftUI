//
//  AppCommand.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Combine
import Kingfisher
protocol AppCommand {
    func execute(in store:Store)
}

struct RegisterAppCommand:AppCommand {
    let email:String
    let password:String
    
    func execute(in store: Store) {
        let token = SubscriptionToken()
        RegisterRequest.init(email: email, password: password)
            .publisher
            .sink { (complete) in
                if case .failure(let error) = complete {
                    store.dispatch(.accountBehaviorDone(result: .failure(error)))
                }
                token.unseal()
            } receiveValue: { (user) in
                store.dispatch(.accountBehaviorDone(result: .success(user)))
            }
            .seal(in: token)
    }
}

struct LoginAppCommand:AppCommand {
    let email:String
    let password:String
    
    func execute(in store: Store) {
        //创建一个 SubscriptionToken 值备用，它需要存活到订阅的异步事件结束。
        let token = SubscriptionToken()
        LoginRequest.init(email: email, password: password).publisher
            .sink(receiveCompletion: { (complete) in
                //当错误发生的时候 这个方法会被调用
                if case .failure(let error) = complete {
                    store.dispatch(
                        .accountBehaviorDone(result: .failure(error))
                    )
                }
                token.unseal()
            }) { (user) in
                //登陆成功的时候这个方法会走
                store.dispatch(
                    .accountBehaviorDone(result: .success(user))
                )
            }
        .seal(in: token)
    }
}

class SubscriptionToken {
    var cancelable:AnyCancellable?
    func unseal() {cancelable = nil}
}

extension AnyCancellable {
    func seal(in token:SubscriptionToken){
        token.cancelable = self
    }
}


struct WriteUserAppCommand:AppCommand {
    let user:User
    func execute(in store: Store) {
        try? FileHelper.writeJSON(user, to: .documentDirectory, fileName: "user.json")
    }
}


struct LoadPokemonsCommand:AppCommand {
    func execute(in store: Store) {
        let token = SubscriptionToken()
        LoadPokemonRequest.all
            .sink { (complete) in
                if case .failure(let error) = complete {
                    store.dispatch(.loadPokemonDone(result: .failure(error))
                    )
                    token.unseal()

                }
            } receiveValue: { (value) in
                store.dispatch(.loadPokemonDone(result: .success(value)))
            }
            .seal(in: token)
    }
}


struct ClearCacheCommand:AppCommand {
    func execute(in store: Store) {
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()
    }
}
