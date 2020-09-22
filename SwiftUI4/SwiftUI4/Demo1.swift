//
//  Demo1.swift
//  SwiftUI4
//
//  Created by developer on 2020/9/15.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
import Combine
 typealias CalculatorState = CalculatorBrain
 typealias CalculatorStateAction = CalculatorButtonItem

 struct Reducer {
     static func reduce(
         state: CalculatorState,
         action: CalculatorStateAction
     ) -> CalculatorState {
         return state.apply(item: action)
     }
 }
struct Demo1: View {
    let scale:CGFloat = UIScreen.main.bounds.width / 414
    
    @State private var editingHistory = false
    @State private var showingResult = false

    //@State private var brain: CalculatorBrain = .left("0")
    //    @ObservedObject var model = CalculatorModel()
    @EnvironmentObject var model:CalculatorModel 
    
    var body: some View {
        VStack(spacing:12) {
            Spacer()
//            Button.init("操作履历: \(model.history.count)") {
//                print(self.model.history)
//                self.editingHistory = true
//            }.sheet(isPresented: self.$editingHistory) { () -> View in
//                HistoryView.init(model: self.model)
//            }
//            Button("操作履历: \(model.history.count)") {
//                print(self.model.history)
//                self.editingHistory = true
//            }.sheet(isPresented: self.$editingHistory) {
//                HistoryView.init(model: self.model)
//            }
            
            HistoryView.init(model: model)
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24 * scale)
                .lineLimit(1)
                .frame(minWidth:0, maxWidth: .infinity, alignment: .trailing)
            
            Button.init("Test") {
//                self.model.brain = CalculatorBrain.left("1.23")
                self.showingResult = true
            }.alert(isPresented: $showingResult) { () -> Alert in
                Alert.init(
                    title:Text("\(model.historyDetail)"),
                    message:Text("\(model.brain.output)"),
                    dismissButton: Alert.Button.cancel())
            }
//            CalculatorButtonPad.init(brain: $model.brain)
            CalculatorButtonPad.init()
                .padding(.bottom)

        }.scaleEffect(scale)
        
    }
}

struct Demo1_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Demo1().environmentObject(CalculatorModel())
//            Demo1().previewDevice("iPhone SE").environment(\.colorScheme, .dark)
        }
    }
}

struct CalculatorButton: View {
 
        let fontSize:CGFloat = 38
        let title:String
        let size:CGSize
        let backgroundColorName:String
        let action: ()->Void
        
        var body: some View {
            Button(action: action) {
                Text.init(title)
                    .font(.system(size: fontSize))
                    .foregroundColor(.white)
                    .frame(width: size.width, height: size.height)
                    .background(Color(backgroundColorName))
                    .cornerRadius(size.width/2)
        }
    }
}
