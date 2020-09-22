//
//  MainTab.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            PokemonRootView.init().tabItem {
                Image.init(systemName: "list.bullet.below.rectangle")
                Text("列表")
            }
            
            SettingRootView().tabItem {
                Image.init(systemName: "gear")
                Text("设置")
            }
        }
//        .edgesIgnoringSafeArea(.top)
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
