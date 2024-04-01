//
//  ContentView.swift
//  RPSClash
//
//  Created by Leo Mogiano on 27/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionRPS = ["🪨", "📄","✂️"].shuffled()
//    let correctsRPS = ["Paper", "Rock", "Scissors"]
    
    @State private var selectionApp = Int.random(in: 0...2)
    @State private var youWon = false
    @State private var completeGame = false
    @State private var showingScore = false
    @State private var scoreResult = ""
    @State private var score = 0
    @State private var phase = 0
    
    @State private var yOffset: Double = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 25)
                Text("Rock, Paper and Scissors")
                    .foregroundStyle(.white)
                    .font(.system(size: 25).bold())
                Spacer()
                    .frame(height: 20)
                Text("Phase \(phase)")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer().frame(height: 50)
                
                (!showingScore)
                ? AnyView(Text("💬")
                    .font(.system(size: 60))
                    .offset(y: yOffset)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                            self.yOffset = 15 // Ajusta la amplitud del movimiento aquí
                        }
                    })
                : AnyView(Text(selectionRPS[selectionApp])
                    .font(.system(size: 60))
                )
                

                Spacer().frame(height: 50)
                
                Text("Select your choice")
                    .foregroundStyle(.white)
                    .font(.title3.bold())
                Spacer().frame(height: 30)
                HStack(spacing:30) {
                    
                    ForEach(selectionRPS, id: \.self) { emoji in
                        Button {
                            rpsTapped(selection: emoji)
                        } label: {
                            Text(emoji)
                                .font(.system(size: 60))
                        }
                        .alert("Now you have,\(score) points", isPresented: $showingScore) {
                            Button("Continue", action: nextMatch)
                        } message: {
                            Text(scoreResult)
                                .font(.title2)
                                .foregroundStyle(youWon ? .green : .red)
                        }
                    }
                }
                Spacer().frame(height: 100)
                Text( (showingScore) ? "Your score is \(score)" : "")
                    .foregroundStyle(youWon ? .green : .red)
                    
                Spacer()
                
            }
        }
        
    }
    
    func rpsTapped(selection: String) {
        let appSelection = selectionRPS[selectionApp]
        print(selection)
        print(appSelection)
        
        if appSelection == selection {
            scoreResult = "😱! It's a Draw"
        } else if (appSelection == "🪨" && selection == "📄") ||
                  (appSelection == "📄" && selection == "✂️") ||
                  (appSelection == "✂️" && selection == "🪨") {
            score += 5
            scoreResult = "🤩 You are doing great!"
            youWon = true
            phase += 1
        } else {
            score -= 5
            scoreResult = "🙁 You lost"
            youWon = false
        }
        
        showingScore = true
    }
    
    func nextMatch () {
        selectionRPS = selectionRPS.shuffled()
        selectionApp = Int.random(in: 0...2)
        yOffset = 0
    }
}


    

#Preview {
    ContentView()
}
