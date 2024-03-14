//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leo Mogiano on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy",
                            "Nigeria", "Poland", "Spain", "Ukraine", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Guess the flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                VStack(spacing:30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.black)
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number: number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }.alert(scoreTitle, isPresented: $showingScore) {
                            Button("Continue", action: askQuestion)
                        } message: {
                            Text("Your score is \(score)")
                        }
                    }
                }
                .frame(maxWidth: 320)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                Text("Score is \(score)")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                Spacer()
                }
            .padding()
        }
    }
    
    //        ZStack {
    //            VStack(spacing:0) {
    //                Color.green
    //                //                Color.yellow
    //                //                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 500)
    //                Color.red
    //            }
    //            Text("Hello, world!")
    //                .foregroundStyle(.secondary)
    //                .padding(50)
    //                .background(.ultraThinMaterial)
    //        }
    //        .ignoresSafeArea()
    //        ZStack {
    //                        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom )
    //                        LinearGradient(stops: [
    //                            .init(color: .white, location: 0.45),
    //                            .init(color: .black, location: 0.55)
    //                        ], startPoint: .top, endPoint: .bottom)
    //                        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
    //                        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
    //                        Text("Hola")
    //                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    //                            .foregroundColor(.white)
    //                            .background(.indigo .gradient)
    //
    //        }
    //        VStack {
    //
    //
    //                        Button("Borrar1",action: executeDelete)
    //                            .buttonStyle(.bordered)
    //                        Button("Borrar2", role: .destructive ,action: executeDelete)
    //                            .buttonStyle(.bordered)
    //                        Button("Borrar3", action: executeDelete)
    //                            .buttonStyle(.borderedProminent)
    //                        Button("Borrar4", role: .destructive ,action: executeDelete)
    //                            .buttonStyle(.borderedProminent)
    //
    //            customized
    //
    //                        Button {
    //                            print("Edit button was tapped")
    //                        } label: {
    //                            Label("Edit", systemImage: "pencil")
    //                                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
    //                                .foregroundStyle(.white)
    //                                .background(.red)
    //                        }
    //                        Button {
    //                            print("Edit button was tapped")
    //                        } label: {
    //                            Image(systemName: "pencil.circle")
    //                                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    //                                            .font(.largeTitle)
    //                        }
    //
    //                        Button("Edit", systemImage: "pencil.circle") {
    //                            print("Edit button was tapped")
    //                        }
    //
    //                        Button {
    //                            print("Edit button was tapped")
    //                        } label: {
    //                            Label("Edit", systemImage: "pencil.circle")
    //                                .padding()
    //                                .foregroundStyle(.white)
    //                                .background(.red)
    //                        }
    //
    //                        Button("Show Alert") {
    //                            showingAlert = true
    //                        }
    //                        .alert("Important message", isPresented: $showingAlert) {
    //                            Button("Delete", role: .destructive) { }
    //                            Button("Cancel", role: .cancel) { }
    //                        } message: {
    //                            Text("Please read this.")
    //                        }
    //
    //        }
    
    func flagTapped(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 10
        } else {
            scoreTitle = "Incorrect"
            score -= 10
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}


#Preview {
    ContentView()
}
