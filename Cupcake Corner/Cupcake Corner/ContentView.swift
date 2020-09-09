//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by developer on 2020/9/4.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    
    @ObservedObject var order = Order()
    
 
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Selected your cake type", selection: $order.type) {
                        ///id:\.self为了避免某种错误
                        ForEach(0..<Order.types.count, id:\.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper.init(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle.init(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if order.specialRequestEnabled {
                        Toggle.init(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle.init(isOn: $order.addSprinkles) {
                            Text("Add extra aprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink.init(destination: Address(order: order)) {
                        Text("Delivery details")
                    }
                }
                
            }.navigationBarTitle("Cupcale Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Form {
//      Section {
//          TextField("Username", text: $username)
//          TextField("Email", text: $email)
//      }
//
//      Section {
//          Button("Create account") {
//              print("Creating account…")
//          }
//      }.disabled(disableForm)
//
//  }
