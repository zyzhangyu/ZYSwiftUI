//
//  main.swift
//  swiftuiandcombinedemo1
//
//  Created by developer on 2020/9/15.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation

print("Hello, World!")

enum 科目:String, CaseIterable {
    case 语文, 数学, 英语, 物理
}

struct Student {
    let name:String
    let scores:[科目:Int]
}

let s1 = Student.init(name: "Jane", scores: [.语文:81,.数学:73,.英语:96,.物理:98])
let s2 = Student.init(name: "Tom", scores: [.语文:89,.数学:63,.英语:82,.物理:78])
let s3 = Student.init(name: "Emma", scores: [.语文:96,.数学:93,.英语:72,.物理:68])
let students = [s1, s2, s3]




var best: (Student, Double)?
for s in students {
    var totalScore = 0
    for key in 科目.allCases {
        totalScore += s.scores[key] ?? 0
    }
    let averageScore = Double(totalScore) / Double(科目.allCases.count)
    if let temp = best {
        if averageScore > temp.1 {
            best = (s, averageScore)
        }
    }else {
        best = (s, averageScore)
    }
}
if let best = best {
    print("最高平均分:\(best.1), 姓名: \(best.0.name)")
}else {
    print("sutdents 为空")
}


func average(_ scores:[科目:Int]) -> Double {
    return Double(scores.values.reduce(0, +)) / Double(科目.allCases.count)
}

let bestStudent = students.map{ ($0, average($0.scores))}.sorted{$0.1 > $1.1}.first


let a1 = students.map { (s) -> Int in
    return s.scores[科目.语文] ?? 0
}.reduce(into: 0.0) { (r, p) in
    r += Double(p)
    }/Double(students.count)
print("\(a1)" + "asdasdasda")




///打印每一科的平均分并按顺序打印
科目.allCases.map { (obj) -> (科目,Int) in
    let a1 = students.map { (student:Student) -> Int in
        return (student.scores[obj] ?? 0)
    }.reduce(0,+) / students.count
    
    return (obj, a1)
    }.sorted(by: {$0.1 > $1.1}).map { (item:(科目, Int)) -> Void in
        print("\(item.0) 平均分  \(item.1)")
    }


 
//1
//a指令时
//b声明
//c声明
//d指令
//
//2d
//
//3


