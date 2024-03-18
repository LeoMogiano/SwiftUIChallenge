//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Leo Mogiano on 17/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello, World!"){
            print(type(of: self.body))
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .background(.red)
    }
}

#Preview {
    ContentView()
}
