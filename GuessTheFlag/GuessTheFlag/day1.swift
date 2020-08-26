//
//  day1.swift
//  GuessTheFlag
//
//  Created by developer on 2020/8/26.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct day1: View {
        
        @State private var showingAlert = false
        
        var body: some View {
            VStack{
    //            Color.init(red: 1, green: 0.5, blue: 0).edgesIgnoringSafeArea(.all)

    //            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
    //            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
    //            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)


                
                VStack(alignment: HorizontalAlignment.leading, spacing: 20) {
                    Text("Hello, World!")
                    Text("This is anther text view")
                }
                
                Button.init(action: {
                    print("Edit button was tapped!")
                    self.showingAlert = true
                }){
                    HStack(spacing:10){
                        Image.init(systemName: "pencil")
    //                        .accentColor(.red)
                            .renderingMode(.original)
                            .foregroundColor(.pink)
                            
                        Text("Edit")
                    }
                }.alert(isPresented:$showingAlert) {
                                Alert.init(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
                }
                    
                ZStack (alignment: .top){
                    Text("Hello, World!")
                    Text("This is anther text view")
                        .background(Color.yellow)
                }
                .background(Color.red)
            
            }
            

        }
}

struct day1_Previews: PreviewProvider {
    static var previews: some View {
        day1()
    }
}
