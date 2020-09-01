//
//  ContentView.swift
//  BetterRest
//
//  Created by developer on 2020/8/31.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct CoffeeCutoffCalculator:View {
    @ObservedObject private var viewModel = Coff
} {
    <#fields#>
}

extension ContentView {
    func calculateBedtime() -> Void {
        let model = SleepCalculator()

        ///表示醒来时间的日期
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "你的理想睡眠时间是:"
            resultDate = sleepTime
        } catch {
            ///    // something went wrong!
            alertTitle = "错误"
            alertMessage = "抱歉,计算您的睡眠时间出现问题！"
            showingAlert = true
        }
    }
}

struct ContentView: View {
    static var defaultWakeTime:Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var resultDate:Date = Date()
    
    
    var body: some View {
        
        NavigationView{
            
            NavigationView {
                VStack(alignment: .center, spacing: 24) {
                    
                    CoffeeCutoffNotice.init(cutoffTIme: resultDate)
                    
                    Form {

                    Section.init(header: Text("您想在什么时候醒来?")
                         .font(.headline)) {
                             DatePicker.init("请输入一个时间:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                     .labelsHidden()
                     }
                    Section.init(header:    Text("渴望的睡眠小时数:")
                        .font(.headline)) {
                            Stepper.init(value: $sleepAmount,in: 4...12, step: 0.25) {
                                Text("\(sleepAmount, specifier: "%g") 小时")
                            }
                    }
                    Section.init(header:     Text("今天喝了几杯咖啡")
                        .font(.headline)) {
                            Stepper.init(value: $coffeeAmount,in: 1...20) {
                                if coffeeAmount == 1 {
                                    Text("1 杯")
                                }else {
                                    Text("\(coffeeAmount) 杯")
                                }
                            }
                    }
                    Section.init(header: Text("建议")) {
                        Text("您应该在3点睡觉睡")
                    }
                    }
                }
            }
            
            .navigationBarTitle("BetterRest")
                  .navigationBarItems(trailing: Button.init("Calculate", action: {
                      print("按钮杯点击")
                      self.calculateBedtime()
                  })).alert(isPresented: $showingAlert) { () -> Alert in
                    Alert.init(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



///通过向咖啡饮用者提出以下三个问题来帮助他们改善睡眠质量

///1.他们什么时候醒来?
///2.他们想要多少个小时的睡眠?
///3.他们每天喝几杯咖啡?
