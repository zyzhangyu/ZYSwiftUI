//
//  Use_Path.swift
//  p9
//
//  Created by developer on 2020/9/4.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Use_Path: View {
    var body: some View {
        Path { path in
                   path.move(to: CGPoint(x: 200, y: 100))
                   path.addLine(to: CGPoint(x: 100, y: 300))
                   path.addLine(to: CGPoint(x: 300, y: 300))
                   path.addLine(to: CGPoint(x: 200, y: 100))
                   //如果不回到第一个点  会有问题
                   path.addLine(to: CGPoint(x: 100, y: 300))

               }
               //填充颜色
               //.fill(Color.blue)
               //stroke描边
               //.stroke(Color.red, lineWidth: 10)
               //使用一种透明的笔触
               //.stroke(Color.blue.opacity(0.25))
               //ShapeStyle结构
               //控制每条线在其后应如何连接到该线（线连接），以及在其后没有连接的情况下应如何绘制每条线（线盖）。
               //这是特别有用的，因为join和cap的选项之一是.round，它会创建圆形的形状：
               .stroke(Color.blue,style: StrokeStyle.init(lineWidth: 10, lineCap: .round, lineJoin: .round))
           
                   }
}

struct Use_Path_Previews: PreviewProvider {
    static var previews: some View {
        Use_Path()
    }
}
