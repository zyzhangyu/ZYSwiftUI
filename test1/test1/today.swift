//
//  today.swift
//  test1
//
//  Created by developer on 2020/8/26.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation

///回溯算法框架
//
//var result = [Any]()
//func backtrack(_ path:Any, _ list:[Any]) -> Void {
//
//    if 满足结束条件 {
//        result.add(path)
//        return;
//    }
//
//    for 选择 in 选择列表 {
//        #做选择
//        「将该路径从选择列表移除」
//        『路径.add选择』
//
//        backtrack(路径, 选择列表啊)
//
//        撤销选择
//        『路径.remove(选择)』
//        『将该选择在此加入选择列表』
//    }
//}
//
//解决回溯问题，实际上就是一个决策树的遍历过程。
//您只需要思考3个问题:
//1.路径
//2.选择列表
//3.结束条件


class Solution333 {
    
   var result = [String]()

   var letter: [String: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {return []}
        var array = Array(digits)
        var path:String = ""
        backtrack(&path, 0, array)
        return result
    }
    
    func backtrack(_ path:inout String, _ index:Int, _ digits:[String.Element]) {
        ///满足结束的条件:
        if (index == digits.count) {
            result.append(path)
            return
        }else {
            
            let digit = digits[index]
            let letters = letter[String(digit)]!
            for item in letters {
                ///做选择
                path.append(item)
                backtrack(&path, index+1, digits)
                path.remove(at: path.index(path.startIndex, offsetBy: index))
            }
        }
    }
}
