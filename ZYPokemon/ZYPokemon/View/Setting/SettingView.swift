//
//  SettingView.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

 struct SettingView: View {
     
    @EnvironmentObject var store : Store
    var settingBinding:Binding<AppState.Settings>{
        $store.appState.settings
    }
    var settings:AppState.Settings {
        store.appState.settings
    }
     
     var accountSection: some View {
                 Section.init(header: Text("账户")) {
                         if settings.loginUser == nil {
                             Picker.init(selection: settingBinding.accountBehavior, label: Text("")) {
                                ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self){
                                     Text($0.text)
                                 }
                             }
                             .pickerStyle(SegmentedPickerStyle())
                             TextField.init("电子邮箱", text: settingBinding.email)
                             TextField.init("密码", text: settingBinding.password)
                             if settings.accountBehavior == .register {
                                 SecureField("确认密码",text: settingBinding.verifyPassword)
                             }
                             
                             if settings.loginRequesting {
         //                        Text("登录中...")
                                 ZYActivityIndicatorView.init(isShowing: settingBinding.loginRequesting  , style: UIActivityIndicatorView.Style.medium)
                             }else {
                                 Button.init(settings.accountBehavior.text) {
                                                    print("登录/注册")
                                                    
                                                    self.store.dispatch(
                                                        .login(email: self.settings.email, password: self.settings.password)
                                                    )
                                                }
                             }
                             
                         }else {
                             Text(settings.loginUser!.email)
                             Button("注销"){
                                 print("注销")
                                 self.store.dispatch(. logout)
                             }
                         }
                     }
     }
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: settingBinding.showEnglishName) {
                Text("显示英文名")
             }
            Picker(selection:settingBinding.sorting, label: Text("排序方式")) {
                ForEach(AppState.Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: settingBinding.showFavoriteOnly) {
                Text("只显示收藏")
                }
        }
    }

    var actionSection: some View {
        Section {
            Button(action: {
                print("清空缓存")
            }) {
                Text("清空缓存").foregroundColor(.red)
            }
        }
    }
     
     var body: some View {
        Form {
    accountSection
        optionSection
        actionSection
        }.alert(item: settingBinding.loginError) { (error) -> Alert in
            return Alert.init(title: Text(error.localizedDescription))
        }
     }
 }

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store()
        store.appState.settings.sorting = .color
        return SettingView().environmentObject(store)
    }
}


extension AppState.Settings.Sorting {
    var text:String {
        switch self {
        case .id:
            return "ID"
        case .name:
            return "名字"
        case .color:
            return "颜色"
        case .favorite:
            return "最爱"
        }
    }
}

extension AppState.Settings.AccountBehavior {
    var text:String {
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登录"
        }
    }
}
