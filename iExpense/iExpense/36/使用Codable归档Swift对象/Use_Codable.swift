//
//  Use_Codable.swift
//  iExpense
//
//  Created by developer on 2020/9/2.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
///一种专门用于存档和取消存档数据的协议，
///这是一种“将对象转换为纯文本然后再次转换”的奇特方式。
struct User : Codable {
    var firstName: String
    var lastName: String
}
struct Use_Codable: View {
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")

    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
        
    }
}

struct Use_Codable_Previews: PreviewProvider {
    static var previews: some View {
        Use_Codable()
    }
}


///UserDefault  Codable联用
///我们将Codable在未来的项目中进行更多的研究，但是现在我们的需求很简单：我们想要归档一个自定义类型，以便我们可以将其放入UserDefaults，然后在从中退出时对其进行取消存档UserDefaults。
