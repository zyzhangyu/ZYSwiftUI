import UIKit

var str = "Hello, playground"
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        ///创建一个字典
        var dictionary:[Int:Int] = nums.reduce(into: [:]) { (params, item) in
            params[item] = (params[item] ?? 0) + 1
        }
        let dic2 = dictionary.sorted(by: {$0.value > $1.value}).prefix(k)
        return dic2.map{$0.key}
    }
}
