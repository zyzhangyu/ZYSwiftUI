//
//  ContentView.swift
//  WordScramble
//
//  Created by developer on 2020/9/1.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var userScore = 0
    var body: some View {
        NavigationView {
            VStack {
                TextField("输入您的单词",text: $newWord, onCommit: addNewWord)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle.init()).padding()
                
                
                List(usedWords, id: \.self) {
                    Image.init(systemName: "\($0.count).circle")
                    Text($0)
                }
                
                Text("您的分数是: \(userScore)")
                    .font(.largeTitle)
                
            }.navigationBarTitle(rootWord)
            .navigationBarItems(leading: HStack{
                      Button.init("ReStart") {
                          self.startGame()
                      }
                  })
        }
            
    .onAppear(perform: startGame)
        .alert(isPresented: $showingError) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            
            }
      
    }
    
    func addNewWord() {
        
        
        ///小写 并删除所有的空格
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // 检查它至少有1个字符，否则退出
        guard answer.count > 0 else {
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            return
        }
        
        guard isMoreThanThreeChar(word: answer) else {
            wordError(title: "单词长度不够", message: "这个单词没有达到3个字母。")
              return
        }
        
        // 将该单词插入usedWords数组中的位置0
        usedWords.insert(answer, at: 0)
        
        userScore += answer.count
        
        // 设置newWord为空字符串
        newWord = ""
    }
    
    func startGame() {
        ///在我们的捆绑包中找到start.txt
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            
            ///加载到字符串中
            if let startWords = try? String(contentsOf: startWordsURL) {
                
                ///将该字符串拆分为字符串数组，每个元素为一个单词
                let allWords = startWords.components(separatedBy: "\n")
                
                ///从那里选择一个随机词分配给rootWord，如果数组为空，则使用明智的默认值。
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("不能够加载start。txt 从 main bundle！")
    }
    
    ///检查这个单词是否被使用过
    func isOriginal(word:String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func isMoreThanThreeChar(word: String) -> Bool {
        guard word.count >= 3 else {
            return false
        }
        return true
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
