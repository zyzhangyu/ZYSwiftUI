//
//  demo1.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}
struct demo2: View {
    var body: some View {
        ///包含100个文本的滚动视图
        VStack(spacing: 10) {
            ForEach(0..<100) {
                CustomText("Item \($0)")
                    .font(.title)
            }
        }
//        .frame(maxWidth: .infinity)

    }
}

struct demo2_Previews: PreviewProvider {
    static var previews: some View {
        demo2()
    }
}
