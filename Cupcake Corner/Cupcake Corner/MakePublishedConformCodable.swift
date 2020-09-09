//
//  MakePublishedConformCodable.swift
//  Cupcake Corner
//
//  Created by developer on 2020/9/4.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI


class User: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Paul Hudson"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}



struct MakePublishedConformCodable: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MakePublishedConformCodable_Previews: PreviewProvider {
    static var previews: some View {
        MakePublishedConformCodable()
    }
}
