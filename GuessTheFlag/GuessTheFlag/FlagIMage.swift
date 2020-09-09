//
//  FlagIMage.swift
//  GuessTheFlag
//
//  Created by developer on 2020/8/27.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct FlagIMage: View {
    var name:String
    var body: some View {
        
        modifier(FlagImageModifier(imageName: name))
    }
}

struct FlagImageModifier:ViewModifier {
    var imageName:String
    func body(content: Content) -> some View {
        VStack {
            Image.init(imageName)
                   .renderingMode(.original)
                                  .clipShape(Capsule())
                                  .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                                  .shadow(color: .black, radius: 2)
    
        }
        
                        
    }
}

struct FlagIMage_Previews: PreviewProvider {
    static var previews: some View {
        FlagIMage.init(name: "UK")
    }
}
