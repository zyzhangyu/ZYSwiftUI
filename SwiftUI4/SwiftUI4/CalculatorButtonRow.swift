//
//  CalculatorButtonRow.swift
//  SwiftUI4
//
//  Created by developer on 2020/9/16.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct CalculatorButtonRow: View {
    
    let row : [CalculatorButtonItem]
 
    @EnvironmentObject var model:CalculatorModel
 
    var body: some View {
        HStack {
            ForEach(row, id:\.self){ item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName) {
                        print("Button: \(item.title)")
                        self.model.apply(item)
                    }
            }
        }
    }
}

//struct CalculatorButtonRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorButtonRow.init(row: [
//        .digit(1), .digit(2), .digit(3), .op(.plus)
//        ], brain: brain)
//        
//    }
//}
