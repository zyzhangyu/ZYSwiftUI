//
//  AddView.swift
//  iExpense
//
//  Created by developer on 2020/9/2.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses:Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    static let types = ["Business", "Personal"]
    @Environment(\.presentationMode) var presentationMode

    ///内置api 根据环境 判断当前是不是model

    var body: some View {
        NavigationView {
            Form {
                TextField.init("Name", text: $name)
                Picker.init("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField.init("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
        .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                

                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()

                }
                
 
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
