//
//  main.swift
//  test1
//
//  Created by developer on 2020/8/25.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation


class Solution {
    var result = [[Int]]()
    var path = [Int]()
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        backtrack(0, nums: nums, last: Int.min)
        result.sort { (item1, item2) -> Bool in
            item1.count > item2.count
        }
        print(result)
        result = result.filter { (item) -> Bool in
            return item.count == result[0].count
        }
        return result.count
        
    }
    
    func backtrack(_ index:Int, nums:[Int], last:Int) {
        
        if index == nums.count {
            if path.count > 0 {
                result.append(path)
            }
        }else {
            
            if nums[index] > last{
                path.append(nums[index])
                backtrack(index+1, nums: nums, last: nums[index])
                path.removeLast()
            }
            
            if nums[index] != last {
                backtrack(index+1, nums: nums, last: last)
            }
            
        }
    }
}
