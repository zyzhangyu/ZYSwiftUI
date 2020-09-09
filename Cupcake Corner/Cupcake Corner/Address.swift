//
//  Address.swift
//  Cupcake Corner
//
//  Created by developer on 2020/9/7.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI




struct Address: View {
    
    @ObservedObject var order : Order
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField.init("Name", text: $order.name)
                TextField.init("Street Address", text: $order.streetAddress)
                TextField.init("City", text: $order.city)
                TextField.init("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }.disabled(order.hasValidAddress == false)
        }.navigationBarTitle("Delivery details", displayMode: .inline)
        }
    }
}

struct Address_Previews: PreviewProvider {
    static var previews: some View {
        Address.init(order: Order())
    }
}
