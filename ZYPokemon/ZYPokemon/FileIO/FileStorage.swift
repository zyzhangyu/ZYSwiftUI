//
//  FileStorage.swift
//  ZYPokemon
//
//  Created by developer on 2020/9/22.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI


@propertyWrapper
struct FileStorage<T:Codable> {
    var value:T?
    
    let directory:FileManager.SearchPathDirectory
    let fileName:String
    
    init(directory:FileManager.SearchPathDirectory, fileName:String) {
        value = try? FileHelper.loadJSON(from: directory, fileName: fileName)
        self.directory = directory
        self.fileName = fileName
    }
    var wrappedValue: T? {
        set {
            value = newValue
            if let value = newValue {
                try? FileHelper.writeJSON(value, to: directory, fileName: fileName)
            } else {
                try? FileHelper.delete(from: directory, fileName: fileName)
            }
        }

        get { value }
    }
}


@propertyWrapper
struct SettingStorage {
    var value:Bool?
    let name:String
    init(name:String){
        self.name = name
    }
    
    var wrappedValue:Bool{
        set {
            value = newValue
            UserDefaults.standard.set(value, forKey: name)
        }
        
        get {
            UserDefaults.standard.bool(forKey: name)  
        }
    }
}
