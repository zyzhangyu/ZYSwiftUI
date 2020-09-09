import UIKit

var str = "Hello, playground"


 
//
//class Solution {
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//
//        guard !candidates.isEmpty else {
//            return [[]]
//        }
//
//        let length = candidates.count
//
//        var result = [[Int]].init()
//
//        var path:[Int] = [Int].init()
//
//        dfs(candidates: candidates, begin: 0, len: length, target: target, path: &path, res: &result)
//
//        return result
//    }
//
//    /**
//       * @param candidates 候选数组
//       * @param begin      搜索起点
//       * @param len        冗余变量，是 candidates 里的属性，可以不传
//       * @param target     每减去一个元素，目标值变小
//       * @param path       从根结点到叶子结点的路径，是一个栈
//       * @param res        结果集列表
//       */
//    func dfs(candidates:[Int], begin:Int, len:Int, target:Int, path: inout [Int], res:inout [[Int]]) {
//
//        // target 为负数和 0 的时候不再产生新的孩子结点
//        if (target < 0){
//            return;
//        }
//        if (target == 0){
//            res.append(path);
//            return
//        }
//
//        // 重点理解这里从begin开始搜索的语意
//        for i in begin..<len {
//            path.append(candidates[i])
//
//            // 注意：由于每一个元素可以重复使用，下一轮搜索的起点依然是 i，这里非常容易弄错
//            dfs(candidates: candidates, begin: i, len: len, target: target - candidates[i], path: &path, res: &res)
//
//            // 状态重置
//            path.removeLast()
//        }
//    }
//}



class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        guard !candidates.isEmpty else {
            return []
        }
        
        var result:[[Int]] = [[Int]].init()
        let len = candidates.count
        var path = [Int].init()
        
        let sort_candidates = candidates.sorted(by: <)
        dfs(candidates: sort_candidates, target: target, len: len, begin: 0, path: &path, result: &result)
        
        return result
    }
    
    
    func dfs(candidates:[Int], target:Int,len:Int, begin:Int, path:inout [Int], result:inout [[Int]]) {
 
        if target == 0 {
            result.append(path)
            return
        }
        
        for i in begin..<len {
            if (target - candidates[i] < 0){
                break
            }
            
            path.append(candidates[i])
            dfs(candidates: candidates, target: target-candidates[i], len: len, begin: i, path: &path, result: &result)
            path.removeLast()
        }
        
    
    }
}
