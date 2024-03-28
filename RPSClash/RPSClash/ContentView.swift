//
//  ContentView.swift
//  RPSClash
//
//  Created by Leo Mogiano on 27/3/24.
//

import SwiftUI

struct ContentView: View {
    
    let selectionRPS = ["Rock", "Paper","Scissors"].shuffled()
    let correctsRPS = ["Paper", "Rock", "Scissors"]
    
    @State private var selectionApp = Int.random(in: 0...2)
    @State private var completeGame = false
    @State private var showingScore = false
    @State private var scoreResult = ""
    @State private var score = 0
    @State private var phase = 0
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 20)
                Text("Rock, Paper and Scissors")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 20)
                Text("Esta es la fase \(phase)")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer().frame(height: 160)
                
                
                
                VStack(spacing:30) {
                    Text("Select your choice")
                        .foregroundStyle(.white)
                    ForEach(selectionRPS, id: \.self) {
                        Text("\($0) 🪨")
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
                
            }
        }
        
    }
    
    func rpsTapped(number: Int) {
        let indexApp = correctsRPS.firstIndex(of: correctsRPS[selectionApp]) ?? 0
        let indexUser = correctsRPS.firstIndex(of: correctsRPS[number]) ??  0
        if ( indexUser == indexApp + 2 ) {
            scoreResult = "Lo sentimos has perdido!"
            showingScore = true
        }
    }
}


    

#Preview {
    ContentView()
}
