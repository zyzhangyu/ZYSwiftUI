//
//  Use_UserDafaults.swift
//  iExpense
//
//  Created by developer on 2020/9/2.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Use_UserDafaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

      var body: some View {
          Button("Tap count: \(tapCount)") {
              self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")

          }
      }
}

struct Use_UserDafaults_Previews: PreviewProvider {
    static var previews: some View {
        Use_UserDafaults()
    }
}
