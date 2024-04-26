//
//  ContentView.swift
//  MultiplyApp
//
//  Created by Leo Mogiano on 26/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isGameStarted = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
