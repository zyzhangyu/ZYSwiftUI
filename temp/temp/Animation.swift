//
//  Animation.swift
//
//  Created by developer on 2020/9/2.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Animation1: View {
    
 
    @State private var isShowingRed = false

     var body: some View {
         VStack {
             Button("Tap Me") {
                 withAnimation {
                     self.isShowingRed.toggle()
                 }             }

             if isShowingRed {
                 Rectangle()
                     .fill(Color.red)
                     .frame(width: 200, height: 200)
                    .transition(.pivot)
             }
         }
     }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation1()
    }
}


struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
