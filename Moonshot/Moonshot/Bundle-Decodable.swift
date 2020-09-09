//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by developer on 2020/9/3.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation

///增加一个方法直接读取json文件 装换为 模型类的数组
 extension Bundle {
    func decode<T:Codable>(_ file:String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("本地Bundle里没有这个文件")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("不能从url将文件转化为Date数据")
        }
        
        let decoder = JSONDecoder()
        
        ///指定decoder日期处理方式
        let formatter = DateFormatter.init()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode([T].self, from: data) else {
            fatalError("数据解码失败,Data无法转化为【T】")
        }
        
        return loaded
    }
}
