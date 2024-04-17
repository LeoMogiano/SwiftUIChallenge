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
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var showingAlert = false
    
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
                
                if score > 0 {
                    Text("Your Score is \(score)")
                        .padding(.horizontal, 80)
                }
                    

            }
            .navigationTitle(rootWord)
            .onSubmit(addWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) { } message: {
                Text(errorMessage)
            }
            .toolbar{
               Button("Restart Game", action: startGame)
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Restart Game") {
//                        showingAlert = true
//                    }
//                }
//            }
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text("Restart Game"), message: Text("¿Estás seguro de que quieres reiniciar el juego?"), primaryButton: .destructive(Text("Sí"), action: {
//                    // Agrega aquí la acción que deseas ejecutar al confirmar el reinicio del juego
//                    // Por ejemplo: startGame()
//                }), secondaryButton: .cancel())
//            }
           
 
        }
        
    }
    
    func addWord() {
        let answer =  newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 3 else {
            wordError(title: "Word too short", message: "Do yo really know language?")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell the word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
            score += answer.count
        }
        
        newWord = ""
        
    }
    
    func startGame() {
        // 1.find the URL for start.txt in our app bundle
        guard let startWordsURL = Bundle.main.url(forResource: "start",withExtension: "txt") else{
            //assign the default value
            rootWord = "yamori"
            // if the url is not found this will print in the console
            print("File could not be found")
            return
        }
        
        do{
            // 2.load start.txt into a string
            let startWords = try String(contentsOf: startWordsURL)
            // 3.split the string up into an array of strings, splitting on line breaks
            let allWords = startWords.components(separatedBy: "\n")
            // 4.pick one random word, or use "yamori" as a sensible default
            rootWord = allWords.randomElement() ?? "yamori"
        } catch{
            //if the file couldn´t be read this will print the error in the console
            print(error)
        }
    }
    
    func isOriginal(word: String) -> Bool {
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
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
        // restart input
        newWord = ""
    }
}

#Preview {
    ContentView()
}
