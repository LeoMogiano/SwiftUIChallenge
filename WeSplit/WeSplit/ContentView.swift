//
//  ContentView.swift
//  WeSplit
//
//  Created by Leo Mogiano on 7/3/24.
//

import SwiftUI

struct ContentView: View {
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
                Picker("Select a character", selection: $selectedCharacter) {
                    ForEach(characters, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
