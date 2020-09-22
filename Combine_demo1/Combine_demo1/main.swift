//
//  main.swift
//  Combine_demo1
//
//  Created by developer on 2020/9/17.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import Combine


let publisher1 = PassthroughSubject<Int, Never>()

print("开始订阅")

let a = publisher1.sink(
    receiveCompletion: { (complete) in
    print(complete)
}, receiveValue: {value in
    print(value)
})
print("Hello, World!")




 //延迟5秒执行
 DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
     publisher1.send(1)
     publisher1.send(2)
     publisher1.send(completion: .finished)
    
}

 
print(a)
