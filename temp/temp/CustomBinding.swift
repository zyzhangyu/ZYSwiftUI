//
//  CustomBinding.swift
//  temp
//
//  Created by developer on 2020/8/31.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct CustomBinding: View {
    
    @State var selection = 0
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    var body: some View {
        let binding = Binding(
            get: {self.selection},
            set:{self.selection = $0}
        )
        
        let agreedToAll = Binding(
            get: {
                self.agreedToTerms && self.agreedToPrivacyPolicy && self.agreedToEmails
            },
            set: {
                self.agreedToTerms = $0
                self.agreedToPrivacyPolicy = $0
                self.agreedToEmails = $0
            }
        )
        
        return VStack {
            Picker.init("Select a number", selection: binding) {
                ForEach(0..<3){
                    Text("Item \($0)")
                }
            }.pickerStyle(SegmentedPickerStyle.init())
            
            
            Toggle.init(isOn: $agreedToTerms) {
                Text("Agree to terms")
            }
            
            Toggle.init(isOn: $agreedToPrivacyPolicy) {
                Text("Agree to privacy policy")
            }
            
            Toggle.init(isOn: $agreedToEmails) {
                Text("Agree to receive shipping emails")
            }
            
            Toggle.init(isOn: agreedToAll) {
                Text("Agree to all")
            }
        }
    }
}

struct CustomBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomBinding()
    }
}
