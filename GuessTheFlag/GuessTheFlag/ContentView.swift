//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leo Mogiano on 12/3/24.
//

import SwiftUI

struct FlagImage: View {
    var img:String
    
    var body: some View {
        Image(img)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

extension View {
    func blueTitle() -> some View {
        modifier(BlueTitle())
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy",
                            "Nigeria", "Poland", "Spain", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var phase = 0
    @State private var completeGame = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Guess the flag")
                    .blueTitle()
//                    .foregroundColor(.white)
//                    .font(.largeTitle.bold())
                Spacer()
                    .frame(height: 10)
                Text("Phase \(phase)/8")
                    .foregroundStyle(.white)
                VStack(spacing:20) {
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
                            FlagImage(img: countries[number])
//                            Image(countries[number])
//                                .clipShape(.capsule)
//                                .shadow(radius: 5)
                        }.alert("Your score is \(score)", isPresented: $showingScore) {
                            Button("Continue", action: askQuestion)
                        } message: {
                            Text(scoreTitle)
                        }.alert("You've finished\nthe game 😃🎉!", isPresented: $completeGame ) {
                            Button("Reset", action: reset)
                        } message: {
                            Text(scoreTitle)
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
    
    func flagTapped(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 10
            phase += 1
            
            if phase > 8 {
                showingScore = false
                completeGame = true
                return
            }
            
        } else {
            scoreTitle = "Wrong, thats the flag of \(countries[number])"
            score = 0
            phase = 0
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        phase = 0
        score = 0
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
    
   
    
}


#Preview {
    ContentView()
}
