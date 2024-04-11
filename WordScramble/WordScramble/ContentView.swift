//
//  ContentView.swift
//  WordScramble
//
//  Created by Leo Mogiano on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    var names = ["Leo", "Mogiano", "Gutierrez"]
    var body: some View {
        List {
            Section {
                ForEach(names, id: \.self) {
                    Text("\($0)")
                }
            }
            Section {
                ForEach(0..<5) {
                    Text("\($0)")
                }
            }
            
        }
       
    }
}

#Preview {
    ContentView()
}
