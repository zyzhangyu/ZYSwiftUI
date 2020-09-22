//
//  CalculatorButtonItem.swift
//  SwiftUI4
//
//  Created by developer on 2020/9/16.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

enum CalculatorButtonItem {
    
    enum Op : String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "x"
        case equal = "="
    }
    
    enum  Command:String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem:Hashable {
    var title : String {
        switch self {
        case .digit(let value):return String(value)
        case .dot: return "."
        case .op(let op):return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
        
    var size:CGSize {
        if case .digit(let value) = self, value == 0{
            return CGSize.init(width: 88 * 2 + 8, height: 88)
        }
        return CGSize.init(width: 88, height: 88)
    }
        
    var backgroundColorName:String {
        switch self {
            case .digit,.dot : return "digitBackground"
            case .op: return "operatorBackground"
            case .command: return "newColor"
        }
    }
}
 


extension CalculatorButtonItem: CustomStringConvertible {
    var description: String {
        switch self {
        case .digit(let num): return String(num)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
}

struct CalculatorButtonItem_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
