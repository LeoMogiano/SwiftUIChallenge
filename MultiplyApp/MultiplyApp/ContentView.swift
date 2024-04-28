//
//  ContentView.swift
//  MultiplyApp
//
//  Created by Leo Mogiano on 26/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isGameStarted = false
    @State private var numberTable = 2
    @State private var numberQuestions = 5
    @State private var randomNum = 0
    @State private var answer = ""
    
    @State private var level = 0
    @State private var showingMessage = false
    @State private var messageAlert = ""
    
    
    var body: some View {
        NavigationStack {
            if !isGameStarted {
                Form {
                    Section (header: Text("Select multiply table")) {
                        Stepper("Table Number \(numberTable)", value: $numberTable, in: 2...12, step: 1)
                    }
                    
                    Section (header: Text("Select number of questions")) {
                        Picker("Number of questions", selection: $numberQuestions) {
                            ForEach(1..<5) { index in
                                Text("\(index * 5)").tag(index * 5)
                            }
                        }
                    }
                    
                    Button(action: {
                        isGameStarted.toggle()
                        randomNum = Int.random(in: 1...10)
                    }) {
                        Text("Start Game")
                            .frame(maxWidth: .infinity)
                    }
                    
                }.navigationTitle("MultiplyGame")
            } else {
                
                Form {
                    
                    Section(header: Text("Answer the question")) {
                        Text("\(numberTable) X \(randomNum)")
                            .frame(maxWidth: .infinity)
                    }
                    
                    Section(header: Text("Enter your answer")) {
                        TextField("", text: $answer )
                            .keyboardType(.numberPad)
                    }
                    
                    Button(action: validateAnswer) {
                        Text("Start Game")
                            .frame(maxWidth: .infinity)
                    }
                    
                    
                    
                }
                .navigationTitle("MultiplyGame")
                
                .alert("Important Message", isPresented: $showingMessage) {
                    Button("OK") { }
                } message: {
                    Text(messageAlert)
                }
            }
            
        }
        
    }
    
    func validateAnswer() {
        let realAnswer = randomNum * numberTable
        let myAnswer = Int(answer) ?? 0
        
        if (realAnswer == myAnswer) {
            showingMessage = true
            messageAlert = "That's correct"
            randomNum = Int.random(in: 1...10)
            level += 1
        } else {
            showingMessage = true
            messageAlert = "I'm sorry that's wrong"
            randomNum = Int.random(in: 1...10)
            level = 0
        }
        
        
    }
}

#Preview {
    ContentView()
}
