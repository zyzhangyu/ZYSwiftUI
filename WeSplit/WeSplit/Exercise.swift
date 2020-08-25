//
//  Exercise.swift
//  WeSplit
//
//  Created by developer on 2020/8/25.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Exercise: View {
    @State private var tapCount = 0
    @State var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    var body: some View {
        
        NavigationView {
            Form {
                
                Section {
                    VStack {
                        Picker.init("Selected your student", selection: $selectedStudent) {
                            ForEach(0..<students.count){
                                Text(self.students[$0])
                            }
                        }
                    }
                }
                
                Section{
                    Text("I am in Section！")
                    Text("I am in Section！")
                    Text("I am in Section！")
                }

                Group{
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")
                    Text("This is a Group!")

                    
                }
                
                Section{
                    Text("I am in Section！")
                    Text("I am in Section！")
                    Text("I am in Section！")
                }
                
                Button.init("Tap Count:\(tapCount)") {
                    self.tapCount += 1
                }
                
                TextField("Enter your name", text: $name)
                
                Section {
                    ForEach(0..<10){number in
                        Text("Row \(number)")
                    }
                    
                    ForEach(10..<20){
                        Text("Row \($0)")
                    }
                }
                

            }
            .navigationBarTitle("SwiftUI", displayMode: NavigationBarItem.TitleDisplayMode.inline)
        }

        
    }
}

struct Exercise_Previews: PreviewProvider {
    static var previews: some View {
        Exercise()
    }
}
