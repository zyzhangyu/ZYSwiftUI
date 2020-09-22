//
//  PokemonInfoRow.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/21.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

///Custom ViewModifier
struct ToolButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 25))
        .foregroundColor(.white)
        .frame(width:30, height: 30)
    }
}
    


struct PokemonInfoRow: View {
    
    
    let expanded:Bool
    let model:PokemonViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image.init(systemName: "person")
                    .resizable()
                    .frame(width:50,height:50)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 4)
                Spacer()
                VStack.init(alignment: .trailing) {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.top,12)
            Spacer()
            HStack(spacing:expanded ? 20 : -30) {
                Spacer()
                Button.init(action: {
                    
                }) {
                    Image.init(systemName: "star")
                    .modifier(ToolButtonModifier())
 
                }
                Button.init(action: {
                    
                }) {
                    Image.init(systemName: "chart.bar")
                        .modifier(ToolButtonModifier())


                }
                Button.init(action: {
                    
                }) {
                    Image.init(systemName: "info.circle")
                     .modifier(ToolButtonModifier())
                }
            }
            .padding(.bottom,12)
            .opacity(expanded ? 1.0 : 0.0)
            .frame(maxHeight: expanded ? .infinity : 0)
        }
        .frame(height: expanded ? 120 : 80)
        .padding(.leading,23)
        .padding(.trailing,15)
        .background(
            ZStack {
                RoundedRectangle.init(cornerRadius: 20)
                    .stroke(Color.green, style: StrokeStyle(lineWidth:4))
                RoundedRectangle.init(cornerRadius: 20)
                           .fill(
                               LinearGradient.init(
                                   gradient: Gradient.init(colors: [.white,.green]),
                                   startPoint: .leading,
                                   endPoint: .trailing
                               )
                       )
            }
        )
        .padding(.horizontal)
    


    }
}

struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PokemonInfoRow.init(expanded: false, model: PokemonViewModel.sample(id: 1))
            PokemonInfoRow.init(expanded: true,model: PokemonViewModel.sample(id: 8))
            PokemonInfoRow.init(expanded: false, model: PokemonViewModel.sample(id: 22))
        }
    }
}
