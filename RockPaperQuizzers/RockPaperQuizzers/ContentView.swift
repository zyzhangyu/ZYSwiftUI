//
//  ContentView.swift
//  RockPaperQuizzers
//
//  Created by developer on 2020/8/31.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isWin = false
    
    enum Card:Int {
        case Rock
        case Paper
        case Scissor
    }
    
    @State var attack:Card = Card.Rock
    @State var defense:Card = Card.Paper
    @State var number = 1
    
    
    var body: some View {
        VStack {
            Text("Problem \(number)")
            
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
