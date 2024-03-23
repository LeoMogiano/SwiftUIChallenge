//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Leo Mogiano on 17/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var toogleExample = false
    var body: some View {
        Button("Hello, World!"){
            toogleExample.toggle()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .foregroundColor(.white)
        .background(toogleExample ? .blue : .red)
    }
}

#Preview {
    ContentView()
}
