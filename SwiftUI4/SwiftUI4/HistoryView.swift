//
//  HistoryView.swift
//  SwiftUI4
//
//  Created by developer on 2020/9/16.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var model:CalculatorModel
    @Environment(\.presentationMode) var persentationMode

    var body: some View {
        VStack {
            HStack {
                

                                    Button.init(action: {
                    //                    self.presentaionMode.wrappedValue.dismiss()
                                        self.persentationMode.wrappedValue.dismiss()
                                        
                                    }) {
                                        Text("cancel")
                                    }

            }.position(x: 20, y: 20)
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                
                HStack {
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)")
                }
                
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1
                )
            }
        }.padding()
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
