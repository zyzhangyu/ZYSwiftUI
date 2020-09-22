//
//  main.swift
//  leetcode demo
//
//  Created by developer on 2020/9/10.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation

print("Hello, World!")

//
//class Solution {
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//
//        let length = candidates.count
//        var result = [[Int]].init()
//        var path:[Int] = [Int].init()
//
//        dfs(candidates: candidates.sorted(by: <), target: target, len: length, path: &path, left: 0, result: &result)
//
//        return result
//    }
//
//    func dfs(candidates:[Int], target:Int, len:Int, path:inout [Int], left:Int, result:inout [[Int]]) {
//
//        print(path)
//        if (target == 0) {
//            print("等于-")
//            result.append(path)
//            return
//        }
//
//        for i in left..<len {
//            if (target - candidates[i]) < 0 {
//                break
//            }else{
//                path.append(candidates[i])
//                dfs(candidates: candidates, target: target-candidates[i], len: len, path: &path, left: i, result: &result)
//                path.removeLast()
//            }
//        }
//    }
//}
//
//
//
//

//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        guard s.count > 0  else {
//            return 0
//        }
//        let array = Array.init(s)
//        var dp = [Int].init(repeating: 1, count: s.count)
//        print(array)
//        var hashmap = [Character:Int].init()
//        hashmap[array.first!] = 0
//        var result = 1
//        for i in 1..<array.count {
//            let lastIndex = hashmap[array[i]] ?? -1
//            let distance = i - lastIndex;
//            if (distance > dp[i-1]){
//                dp[i] = dp[i-1]+1
//            }else {
//                dp[i] = i - lastIndex
//            }
//            result = max(result, dp[i])
//            hashmap[array[i]] = i
//        }
//
//        return result
//    }
//}

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        guard candidates.count > 0 else {
            return [[]]
        }
        
        var length = candidates.count
        var result = [[Int]].init()
        var path = [Int].init()
        
        dfs(candidates: candidates.sorted(by: <), begin: 0, path: &path, result: &result, target: target,len: length, last: -1)
        return result
    }
    
    func dfs(candidates:[Int], begin:Int, path:inout [Int], result:inout [[Int]], target:Int, len:Int, last:Int) {
        
        //设置终止条件
        if target == 0 {
            result.append(path)
            return
        }
        
        for i in begin..<len {
            
            if target - candidates[i] < 0 {
                ///跳出这个for循环
                break;
            }
            
            if (i > begin && candidates[i] == candidates[i-1]) {
                continue
            }
            
            path.append(candidates[i])
            dfs(candidates: candidates, begin: i+1, path: &path, result: &result, target: target - candidates[i], len: len, last: candidates[i])
            path.removeLast()
            
        }
    }
}

let s = Solution()
var r = s.combinationSum2([10,1,2,7,6,1,5],8)
print(r)
