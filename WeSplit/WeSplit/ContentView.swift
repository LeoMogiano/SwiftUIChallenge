//
//  ContentView.swift
//  WeSplit
//
//  Created by Leo Mogiano on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAumount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    let characters = ["Luffy", "Zoro", "Sanji"]
    @State private var selectedCharacter = "Luffy" // Apple recommends use State with private
    // name binding state allows read and write the value
    var body: some View {
        //        NavigationStack {
        //            Form {
        //                Picker("Select your student", selection: $selectedStudent) {
        //                    ForEach(students, id: \.self) {
        //                        Text($0)
        //                    }
        //                }
        //            }
        //        }
        NavigationStack {
            
            Form {
                //                Picker("Select a character", selection: $selectedCharacter) {
                //                    ForEach(characters, id: \.self) {
                //                        Text($0)
                //                    }
                //                }
                Section {
                    TextField("Amount", value: $checkAumount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.numbersAndPunctuation)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<11) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                
            }.navigationTitle("WeSplit")
        }
        
    }
}


#Preview {
    ContentView()
}
