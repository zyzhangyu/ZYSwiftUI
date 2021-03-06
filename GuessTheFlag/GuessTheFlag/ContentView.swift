//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by developer on 2020/8/26.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var userScore = 0
    @State private var errorMessage = ""
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View{

        ZStack {
            ///渐变背景色
            LinearGradient(
                gradient: Gradient(colors: [.blue, .pink, .black]),
                startPoint: .top,
                endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30) {
                
                ///题目
                VStack{
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }.foregroundColor(.white)
                
                
                ///3个按钮
                ForEach(0..<3){number in
                    Button.init(action: {
                        self.flagTapped(number)
                    }) {
                        if number == self.correctAnswer {
                            FlagIMage.init(name: self.countries[number])

                        } else {
                            FlagIMage.init(name: self.countries[number])
                        }
                        
                    }
                }
                
                Spacer()
                
                Text("Your score is \(userScore)")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
            }
        
        }.alert(isPresented: $showingScore) { () -> Alert in
            Alert.init(title: Text(scoreTitle), message: Text(errorMessage), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number:Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 20
            errorMessage = "Yes .It is."
        }else {
            scoreTitle = "Wrong"
            userScore -= 20
            errorMessage = "Wrong, That is the flag of \(countries[number])"
//            showingScore = true
        }
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
