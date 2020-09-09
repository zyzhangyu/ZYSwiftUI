//
//  Use_onDelete.swift
//  iExpense
//
//  Created by developer on 2020/9/2.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Use_onDelete: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }.onDelete(perform: removeRows)
                }

                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }.navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct Use_onDelete_Previews: PreviewProvider {
    static var previews: some View {
        Use_onDelete()
    }
}
