//
//  ContentView.swift
//  WeSplit
//
//  Created by developer on 2020/8/25.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson:Double {
        ///几人
        let peopleCount = Double(numberOfPeople + 2)
        ///小费的百分比多少
        let tipSelection = Double(tipPercentages[tipPercentage])
        ///餐费总额
        let orderAmout = Double(checkAmount) ?? 0
        ///餐费总小费额度
        let tipValue = orderAmout / 100 * tipSelection
        /// 餐费总额 + 小费总额
        let grandTotal = orderAmout + tipValue
        /// 除以人数 每人要付的钱
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body : some View{
        NavigationView {
            Form {
                Section {
                    TextField.init("Amount", text: $checkAmount)
                        .keyboardType(UIKeyboardType.decimalPad)
                    
             
                    
                    Picker.init("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section.init(header:Text("How much tip do you want to leave?") ){
                    Picker.init("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle.init())
                }
                
                Section{
                    Text("\(totalPerPerson,specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit", displayMode: NavigationBarItem.TitleDisplayMode.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
