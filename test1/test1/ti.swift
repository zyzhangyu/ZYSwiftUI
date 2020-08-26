//
//  ti.swift
//  test1
//
//  Created by developer on 2020/8/26.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
class Solution12 {
    
    var temp = [Int]()
    var ans = [[Int]]()
    
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        
        dfs(current: 0, last: Int.min, nums: nums)
        return [[0]]
    }
    
    ///current 数组最左边的下标
    ///当前最小值
    ///nums完整数组
    func dfs(current:Int, last:Int, nums:[Int]) {
        
        ///如果当前下标已经和数组长度相等，表示数数组下标已经走完了 全部数组了!
        if (current == nums.count) {
            ///temp.count>=2 及可构成一个子序列
            if (temp.count >= 2){
                ///将子序列添加到答案之中
                ans.append(temp)
            }
            return;
        }
        
        ///因为是自增序列 所以nums[current]一定要比子序列里的最后一个值大 才可以添加到这个子序列组成新的子序列
        if nums[current] >= last {
            temp.append(nums[current]);
            dfs(current: current+1, last: nums[current], nums: nums)
            temp.removeLast()
        }
        
        ///去重
        if (nums[current] != last) {
            dfs(current: current+1, last: last, nums: nums)
        }
    }
}


//let s = Solution()
//
//let b =  s.findSubsequences([4,6,7,7])
//print(b)
