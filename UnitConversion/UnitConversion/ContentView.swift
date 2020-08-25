//
//  ContentView.swift
//  UnitConversion
//
//  Created by developer on 2020/8/25.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickBinding = 0
    let segments = ["Temperature","Length"]
    let sourceUnit = ["Degree centigrade", "Kilometer"]
    let targetUnit = ["Fahrenheit degree", "Meter"]
    @State var sourceDegree = "30"
    
    var targetStr:Double {
        
        let source = Double(sourceDegree)!
        if pickBinding == 0 {
            return source * 1.8 + 32.0
        }else {
            return source * 1000.0
        }
        
    }
    var body: some View {
        Form {
            
            Section.init(header: Text("Conversion Category")) {
                
                Picker.init("picker title", selection: $pickBinding) {
                    ForEach(0..<segments.count){
                        Text("\(self.segments[$0])")
                    }

                }.pickerStyle(SegmentedPickerStyle.init())
            }
            
            Section.init(header: Text("\(sourceUnit[pickBinding])")) {
                TextField.init("Input Degree Centigrade", text: $sourceDegree)
            }
            
            Section.init(header: Text("\(targetUnit[pickBinding])")) {
                Text("\(targetStr)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
