//
//  AstronautView.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let missions: [Mission]
    let astronaut : Astronaut
 
    init(missions: [Mission], astronaut:Astronaut) {
        
        self.astronaut = astronaut
        
        
        self.missions = missions.filter { (mission) -> Bool in
            
            let index = mission.crew.firstIndex { (temp) -> Bool in
                
                 if temp.name == astronaut.id{
                    return true
                }
                return false
            }
            
            if index != nil {
                return true
            }
            return false
        }
        
        print(self.missions)
    }
    

    
    var body: some View {
        GeometryReader{geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width:geometry.size.width)
                    
                    Text.init(self.astronaut.description)
                    .padding()
                    .layoutPriority(1)
                    
                    
                    Text("Alii missions")
                        .font(.headline)
                        .padding()
                    ForEach.init(self.missions) { (item:Mission) in
                        Text(item.displayName)
                            .padding()
                    }
                    
                }
            }
        }.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(missions: missions,astronaut: astronauts[0])
    }
}
