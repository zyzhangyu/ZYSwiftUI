//
//  Use_ ImagePaint.swift
//  p9
//
//  Created by developer on 2020/9/4.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Use__ImagePaint: View {
    var body: some View {
//        Text("Hello World")
//        .frame(width: 300, height: 300)
////          .background(Color.red)
////        .border(Color.red, width: 30)
////        .background(Image("Image1"))
////        .border(ImagePaint(image: Image("Image1"), scale: 0.2), width: 30)
//
//        .border(ImagePaint(image: Image("Image1"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)

        Capsule()
        .strokeBorder(ImagePaint(image: Image("Image1"), scale: 0.1), lineWidth: 20)
        .frame(width: 300, height: 200)
    }
}

struct Use__ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        Use__ImagePaint()
    }
}
