//
//  ContentView.swift
//  iExpense
//
//  Created by Leo Mogiano on 30/4/24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Text("Hello")
    }
}

struct ContentView: View {
    @Observable
    class User {
        var firstName = "Leo"
        var lastName = "Mogiano"
    }
    
    @State private var mogiUser = User()
    
    var body: some View {
        VStack {
            Text("\(mogiUser.firstName)")
            Text("\(mogiUser.lastName)")
            
            TextField("Input de Nombre", text: $mogiUser.firstName)
            TextField("Input de Nombre", text: $mogiUser.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
