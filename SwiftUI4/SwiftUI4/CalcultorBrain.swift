//
//  CalcultorBrain.swift
//  SwiftUI4
//
//  Created by developer on 2020/9/16.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
enum CalculatorBrain {
    
    //1.左侧数字
    case left(String)
    //2.左侧数字和符号
    case leftOp(left:String, op:CalculatorButtonItem.Op)
    //3.左侧数字 符号 右侧数字
    case leftOpRight(left:String, op:CalculatorButtonItem.Op, right:String)
    //4.错误 比如除以0
    case error
    
    case showResult(String)
    
    
    @discardableResult
    //接收输入的按钮数据的apply
    func apply(item: CalculatorButtonItem) -> CalculatorBrain {
        switch item {
        case .digit(let num):
            return apply(num: num)
        case .dot:
            return applyDot()
        case .op(let op):
            return apply(op: op)
        case .command(let command):
            return apply(command: command)
        }
    }
    
    ///对外提供一个现实结果字符串的output属性
    var output: String {
        let result: String
        switch self {
        case .left(let left): result = left
        case .leftOp(let left, _): result = left
        case .leftOpRight(_, _, let right): result = right
        case .error: return "Error"
        case .showResult(let end):result = end
        }
        guard let value = Double(result) else {
            return "Error"
        }
        return formatter.string(from: value as NSNumber)!
    }
    
    private func apply(num: Int) -> CalculatorBrain {
        switch self {
        case .left(let left):
            return .left(left.apply(num: num))
        case .leftOp(let left, let op):
            return .leftOpRight(left: left, op: op, right: "0".apply(num: num))
        case .leftOpRight(let left, let op, let right):
            return .leftOpRight(left: left, op: op, right: right.apply(num: num))
        case .error:
            return .left("0".apply(num: num))
        case .showResult( _):
            return .left("0".apply(num: num))
        }
    }
    
    private func applyDot() -> CalculatorBrain {
        switch self {
        case .left(let left):
            return .left(left.applyDot())
        case .leftOp(let left, let op):
            return .leftOpRight(left: left, op: op, right: "0".applyDot())
        case .leftOpRight(let left, let op, let right):
            return .leftOpRight(left: left, op: op, right: right.applyDot())
        case .error:
            return .left("0".applyDot())
        case .showResult(let end):
            return .left("0")
        }
        
    }
    
    private func apply(op: CalculatorButtonItem.Op) -> CalculatorBrain {
        switch self {
        case .left(let left):
            switch op {
            case .plus, .minus, .multiply, .divide:
                return .leftOp(left: left, op: op)
            case .equal:
                return self
            }
        case .leftOp(let left, let currentOp):
            switch op {
            case .plus, .minus, .multiply, .divide:
                return .leftOp(left: left, op: op)
            case .equal:
                if let result = currentOp.calculate(l: left, r: left) {
                    return .leftOp(left: result, op: currentOp)
                } else {
                    return .error
                }
            }
        case .leftOpRight(let left, let currentOp, let right):
            switch op {
            case .plus, .minus, .multiply, .divide:
                if let result = currentOp.calculate(l: left, r: right) {
                    return .leftOp(left: result, op: op)
                } else {
                    return .error
                }
            case .equal:
                if let result = currentOp.calculate(l: left, r: right) {
                    return .showResult(result)
                } else {
                    return .error
                }
            }
        case .error:
            return self
            
        case .showResult(let end):
            return self
        }
    }

    private func apply(command: CalculatorButtonItem.Command) -> CalculatorBrain {
        switch command {
        case .clear:
            return .left("0")
        case .flip:
            switch self {
            case .left(let left):
                return .left(left.flipped())
            case .leftOp(let left, let op):
                return .leftOpRight(left: left, op: op, right: "-0")
            case .leftOpRight(left: let left, let op, let right):
                return .leftOpRight(left: left, op: op, right: right.flipped())
            case .error:
                return .left("-0")
            case .showResult:
                return .left("0")
            }
        
        case .percent:
            switch self {
            case .left(let left):
                return .left(left.percentaged())
            case .leftOp:
                return self
            case .leftOpRight(left: let left, let op, let right):
                return .leftOpRight(left: left, op: op, right: right.percentaged())
            case .error:
                return .left("-0")
            case .showResult:
                return .left("0")
            }
        }
    }
}

///将小数点后面的位数限制在8位以内
var formatter: NumberFormatter = {
    let f = NumberFormatter()
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 8
    f.numberStyle = .decimal
    return f
}()

extension String {
    var containsDot: Bool {
        return contains(".")
    }

    var startWithNegative: Bool {
        return starts(with: "-")
    }

    func apply(num: Int) -> String {
        return self == "0" ? "\(num)" : "\(self)\(num)"
    }

    func applyDot() -> String {
        return containsDot ? self : "\(self)."
    }

    func flipped() -> String {
        if startWithNegative {
            var s = self
            s.removeFirst()
            return s
        } else {
            return "-\(self)"
        }
    }

    func percentaged() -> String {
        return String(Double(self)! / 100)
    }
}


extension CalculatorButtonItem.Op {
    func calculate(l: String, r: String) -> String? {

        guard let left = Double(l), let right = Double(r) else {
            return nil
        }

        let result: Double?
        switch self {
        case .plus: result = left + right
        case .minus: result = left - right
        case .multiply: result = left * right
        case .divide: result = right == 0 ? nil : left / right
        case .equal: fatalError()
        }
        return result.map { String($0) }
    }
}



