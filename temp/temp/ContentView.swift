//
//  ContentView.swift
//  temp
//
//  Created by developer on 2020/8/27.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {

    var body: some View {
//        Text("hello")
//        .titleStyle()
        
        
//        Color.blue
//            .frame(width:300, height: 200)
//            .watermarked(with: "Hacking with Swift")
        VStack {
//            GridStack.init(rows: 4, columns: 4) { row, col in
//                HStack{
//                    Image(systemName: "\(row * 4 + col).circle")
//                    Text("R \(row) C\(col)")
//                }
//            }
            
            
            GridStack.init(rows: 4, columns: 4) { row, col  in
                Image(systemName: "\(row * 4 + col).circle")
                Text("R \(row) C\(col)")
            }
            
            Text("aaa")
            .modifier(CustomModifirer())
        }
        

    }
}

struct CustomModifirer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct Watermark: ViewModifier {
    var text:String
    func body(content:Content) -> some View {
        ZStack(alignment:.bottomTrailing){
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text:String) -> some View {
        self.modifier(Watermark(text: text))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
