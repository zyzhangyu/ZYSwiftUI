//
//  CalculatorModel.swift
//  SwiftUI4
//
//  Created by developer on 2020/9/16.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
class CalculatorModel: ObservableObject {
    
    //PassthroughSubject 会提供一个send方法 告诉外界 发生改变了
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @Published var history:[CalculatorButtonItem] = []
    
    //对这个model.brain的设计 会触发 willSet 会被广播出去
    var brain:CalculatorBrain = .left("0"){
        
        willSet{objectWillChange.send()}
    }
    
    
    func apply(_ item:CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    var historyDetail:String {
        history.map({ (item) -> String in
            return item.description
        }).joined()
    }
    
    var temporaryKept:[CalculatorButtonItem] = []
    
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    
    var slidingIndex:Float = 0 {
        didSet {
            // 5
            // 维护 `history` 和 `temporaryKept`
            
            keepHistpry(upTo: Int(slidingIndex))
        }
    }
    
    func keepHistpry(upTo index:Int) {
        precondition(index <= totalCount, "Out of index")
        
        let total = history + temporaryKept
        
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        
        brain = history.reduce(CalculatorBrain.left("0"), { (result, item)  in
            result.apply(item: item)
        })
    }
    
}
