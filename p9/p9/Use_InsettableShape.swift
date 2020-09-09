//
//  Use_InsettableShape.swift
//  p9
//
//  Created by developer on 2020/9/4.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
struct Arc2: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}
struct Use_InsettableShape: View {
    var body: some View {
//        Circle()
//            .strokeBorder(Color.blue, lineWidth: 40)
        Arc2(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        .strokeBorder(Color.blue, lineWidth: 40)
    }
    
}

struct Use_InsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        Use_InsettableShape()
    }
}
