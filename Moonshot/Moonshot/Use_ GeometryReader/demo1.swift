//
//  demo1.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct demo1: View {
    var body: some View {
        VStack {
                 Image("anders")
                   ///resizable可以调整图片尺寸 但是宽高比例会被破坏掉
                   .resizable()
                   ///这个可以让图片保持原始的宽高比，宽度会被撑满，但是高度可能达不到
                   ///fill会让图片显示不全
                   .aspectRatio(contentMode: .fit)
                   .frame(width:300, height: 300)
               
                   ///clipped可以切掉在尺寸外的图片内容 但是图片显示不完整
                   ///不会破坏宽高比
                   .clipped()
               
                   ///使用GeometryReader,我们将获得一个GeometryProxy要使用的对象。这使我们可以查询环境：容器有多大？我们的立场是什么？是否有安全区域插图？等等。
               GeometryReader.init { proxy in
                   Image("anders")
                   .resizable()
                       .aspectRatio(contentMode: .fit)
                       ///下面这个的宽度会一直和屏幕宽度一样
                       ///但是它知道原始宽度 知道目标宽度 知道内容模式(比例)
                       ///可以推测出目标高度
                       .frame(width:proxy.size.width)
               }
             }    }
}

struct demo1_Previews: PreviewProvider {
    static var previews: some View {
        demo1()
    }
}
