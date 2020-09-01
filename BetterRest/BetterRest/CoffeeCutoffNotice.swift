//
//  CoffeeCutoffNotice.swift
//  BetterRest
//
//  Created by developer on 2020/9/1.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

let coffeeCutoffTime: DateFormatter = {
    let formatter = DateFormatter()
    
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    
    return formatter
}()

struct CoffeeCutoffNotice: View {
    
    let cutoffTIme : Date
    

    
    var body: some View {
        VStack(alignment: .center, spacing: 12.0) {
            Text("Coffee Cutoff Time")
                .font(.headline)
                .fontWeight(.bold)
            
            Text("\(cutoffTIme, formatter: coffeeCutoffTime)")
                .font(.largeTitle)
                .foregroundColor(.pink)
        }
        .multilineTextAlignment(.center)
        .padding()
        
        
    }
}

struct CoffeeCutoffNotice_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCutoffNotice(cutoffTIme: Date.init())
    }
}
