//
//  ContentView.swift
//  SnowSeeker
//
//  Created by developer on 2020/9/11.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI
 

struct ContentView: View {
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
 

    var body: some View {
        
        
         NavigationView {
             List(resorts) { resort in
                 NavigationLink(destination: Text(resort.name)) {
                     Image(resort.country)
                         .resizable()
                         .scaledToFill()
                         .frame(width: 40, height: 25)
                         .clipShape(
                             RoundedRectangle(cornerRadius: 5)
                         )
                         .overlay(
                             RoundedRectangle(cornerRadius: 5)
                                 .stroke(Color.black, lineWidth: 1)
                         )

                     VStack(alignment: .leading) {
                         Text(resort.name)
                             .font(.headline)
                         Text("\(resort.runs) runs")
                             .foregroundColor(.secondary)
                     }
                 }
             }
             .navigationBarTitle("Resorts")
            
            WelcomeView()

         }

        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    
 
//    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
//    static let example = allResorts[0]

    
    static var previews: some View {
        ContentView()
    }
}
