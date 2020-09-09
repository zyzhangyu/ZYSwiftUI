//
//  Section2.swift
//  Bookworm
//
//  Created by developer on 2020/9/9.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct Section2: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        if sizeClass == .compact {
            return HStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle)
        } else {
            return HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle)
        }
        
    }
}

struct Section2_Previews: PreviewProvider {
    static var previews: some View {
        Section2()
    }
}
