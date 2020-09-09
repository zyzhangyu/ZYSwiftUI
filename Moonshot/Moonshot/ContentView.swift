//
//  ContentView.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(missions) { mission in
                       
                NavigationLink.init(destination: MissionView.init(mission: mission, astronauts: self.astronauts)) {
                    
                    Image(mission.image)
                        .renderingMode(.original)
                        .resizable()
                        //    .scaledToFit()等价下面这个
                        .aspectRatio(contentMode: .fit)
                        .frame(width:44, height: 44)
                    
                    
                    VStack(alignment: .leading)  {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        Text(mission.formattedLaunchDate)
                    }
                        
                    
                }
            }.navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
