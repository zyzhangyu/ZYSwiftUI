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



//class Solution {
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//
//        guard !candidates.isEmpty else {
//            return []
//        }
//
//        var result:[[Int]] = [[Int]].init()
//        let len = candidates.count
//        var path = [Int].init()
//
//        let sort_candidates = candidates.sorted(by: <)
//        dfs(candidates: sort_candidates, target: target, len: len, begin: 0, path: &path, result: &result)
//
//        return result
//    }
//
//
//    func dfs(candidates:[Int], target:Int,len:Int, begin:Int, path:inout [Int], result:inout [[Int]]) {
//
//        if target == 0 {
//            result.append(path)
//            return
//        }
//
//        for i in begin..<len {
//            if (target - candidates[i] < 0){
//                break
//            }
//
//            path.append(candidates[i])
//            dfs(candidates: candidates, target: target-candidates[i], len: len, begin: i, path: &path, result: &result)
//            path.removeLast()
//        }
//
//
//    }
//}


//
//class Solution {
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//
//        var length = candidates.count
//        var result = [[Int]].init()
//        var path:[Int] = [Int].init()
//        dfs(candidates: candidates, target: target, len: length, path: &path, left: 0, result: &result)
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
//            }
//            path.append(candidates[i])
//
//            dfs(candidates: candidates, target: target-candidates[i], len: len, path: &path, left: i, result: &result)
//            path.removeLast()
//        }
//    }
//}
//
//let s = Solution()
//
//s.combinationSum([8,7,4,3], 11)



class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        
        backTrace(board: &board,row: 0,col: 0)
    }


    func backTrace( board:inout [[Character]], row: Int, col: Int) -> Bool{

        //注意row是从0开始的，当row等于board.length的时候表示数独的
        //最后一行全部读遍历完了，说明数独中的值是有效的，直接返回true
        if (row == board.count) {
            return true
        }

        //如果当前行的最后一列也遍历完了，就从下一行的第一列开始。这里的遍历
        //顺序是从第1行的第1列一直到最后一列，然后第二行的第一列一直到最后
        //一列，然后第三行的……
        if (col == board.count) {
            return backTrace(board: &board, row: row + 1, col: 0)
        }

        //如果当前位置已经有数字了，就不能再填了，直接到这一行的下一列
        if (board[row][col] != ".") {
            return backTrace(board: &board, row: row, col: col + 1)
        }

        //如果上面条件都不满足，我们就从1到9中选择一个合适的数字填入到数独中
        for i in 1..<10 {
             //判断当前位置[row，col]是否可以放数字i，如果不能放再判断下
             //一个能不能放，直到找到能放的为止，如果从1-9都不能放，就会下面
             //直接return false
            
            if (!isValid(board: &board, row: row, col: col, c: Character.init("\(i)"))){
                continue;
            }
            //如果能放数字i，就把数字i放进去
            board[row][col] = Character.init("\(i)");
            if (backTrace(board: &board, row: row, col: col)) {
                return true
            }
            board[row][col] = ".";
        }
        return false
    }

    //验证当前位置[row，col]是否可以存放字符c
    func isValid(board:inout [[Character]], row:Int, col:Int, c:Character) -> Bool {

        ///通过外层9的循环可以轻松的拿到同行或者同列是否存在
        for i in 0..<9 {
                 ///找每一列
            if (board[i][col] != "." && board[i][col] == c){
                return false
            }
            ///找每一行
            if (board[row][i] != "." && board[row][i] == c){
                return false
            }
            //board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != "."
            // [3 * (row / 3) + i / 3]
            // [3 * (col / 3) + i % 3]
            if (board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != "." && board[3 * (row/3) + i/3][3 * (col / 3) + i % 3] == c) {
                return false
            }
        }

        return true
     }
}

var pa:[[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
let s = Solution()
var r: () = s.solveSudoku(&pa)

print(pa)
