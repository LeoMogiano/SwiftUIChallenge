//
//  ContentView.swift
//  WordScramble
//
//  Created by Leo Mogiano on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    //    var names = ["Leo", "Mogiano", "Gutierrez"]
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text("\(word)")
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addWord)
            .onAppear(perform: startGame)
        }
        
    }
    
    func addWord() {
        let answer =  newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        // extra validation
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
        
    }
    
    func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordURL) {
                let allWord = startWords.components(separatedBy: "/n")
                rootWord = allWord.randomElement() ?? "silkorm"
            }
        }
        
        fatalError("Could not load start.txt from the bundle.")
    }
}

#Preview {
    ContentView()
}
