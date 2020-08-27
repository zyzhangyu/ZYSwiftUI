//
//  GridStack.swift
//  temp
//
//  Created by developer on 2020/8/27.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct GridStack<Content:View>: View {
    
    let rows:Int
    let columns:Int
    let content:(Int,Int) -> Content
    
    init(rows:Int, columns:Int, @ViewBuilder content:@escaping (Int,Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        VStack{
            ForEach(0..<rows,id: \.self){row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack.init(rows: 0, columns: 0) {_,_ in
            Text("b")
        }
    }
}
