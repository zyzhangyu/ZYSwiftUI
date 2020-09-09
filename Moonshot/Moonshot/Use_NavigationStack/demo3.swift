//
//  demo3.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct demo3: View {
    var body: some View {
        NavigationView {
               List(0..<100) { row in
                         NavigationLink(destination: Text("Detail \(row)")) {
                             Text("Row \(row)")
                         }
                     }
                  .navigationBarTitle("SwiftUI")
              }
        
    }
}

struct demo3_Previews: PreviewProvider {
    static var previews: some View {
        demo3()
    }
}
