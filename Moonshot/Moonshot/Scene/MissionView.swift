//
//  MissionView.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    
    let mission:Mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    
    
    let astronauts : [CrewMember]
    
    
    init(mission: Mission, astronauts: [Astronaut]){
        
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}){
                matches.append(CrewMember.init(role: member.role, astronaut: match))
            } else {
                fatalError("没找到 \(member)")
            }
        }
        
        self.astronauts = matches
    }
    
    var body: some View {
        GeometryReader.init { geometry in
            ScrollView.init(.vertical, showsIndicators: false) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    HStack(alignment: .center, spacing: 10) {
                        Text("Launch Date:")
                        Text(self.mission.formattedLaunchDate)
                        .font(.headline)
                    }
                    
                    Text(self.mission.description)
                    .padding()
                    
                    Spacer(minLength: 25)
                    
                    ForEach(self.astronauts, id: \.role) {crewMember in
                        NavigationLink.init(destination: AstronautView.init(missions: Bundle.main.decode("missions.json"), astronaut: crewMember.astronaut)) {
                            HStack {
                                                  Image(crewMember.astronaut.id)
                                                  .resizable()
                                                      .frame(width: 83, height: 60)
                                                  .clipShape(Capsule())
                                                      .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                                  
                                                  VStack(alignment: .leading, spacing: nil) {
                                                      Text(crewMember.astronaut.name)
                                                          .font(.headline)
                                                      Text(crewMember.role)
                                                          .foregroundColor(.secondary)
                                                  }
                                                  
                                                  Spacer()
                                              }
                                              .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text.init(mission.displayName), displayMode: .inline)
        .buttonStyle(PlainButtonStyle.init())
    }
}

struct MissionView_Previews: PreviewProvider {
    static let mission:[Mission] = Bundle.main.decode("missions.json")
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView.init(mission: mission[0], astronauts: astronauts)
    }
}
