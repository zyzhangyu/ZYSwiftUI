//
//  main.swift
//  test2
//
//  Created by developer on 2020/8/27.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation

print("Hello, World!")

class Solution {
    
    
    var index = [Character:[Int]]()
    var peek = [Int].init(repeating: -1, count: 26)
    var N:Int = Int.min
    func uniqueLetterString(_ s: String) -> Int {
        
        N = s.count
        let array = Array(s)
        for i in 0..<s.count {
            let c = array[i]
            index.compactMapValues { (ints) -> [Int] in
                return [i]
            }
            
            var cur = 0
            var ans = 0
            for char in index.keys {
                
            }
            
        }
        
        return 1
    }
}

extension String {
    
    subscript(_ i:Int) -> Character {
        ///读取字符
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}

extension Character {
    var ascii:Int {
        get {
            return Int(self.unicodeScalars.first?.value ?? 0)
        }
    }
}

 
