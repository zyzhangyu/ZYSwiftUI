//
//  Abstronaut.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import UIKit

//符合Codable可以直接从Json创建此结构体的实例
//Identifiable协议让实例集合在ForEach之中能够区分彼此(其实就id属性唯一性)
struct Astronaut: Codable, Identifiable {
    let id : String
    let name : String
    let description : String
}
