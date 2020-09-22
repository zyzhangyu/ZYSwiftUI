//
//  Resort.swift
//  SnowSeeker
//
//  Created by developer on 2020/9/11.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import SwiftUI
struct Resort: Codable, Identifiable {
    
       
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
    
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
}
