//
//  ContentView.swift
//  Animations
//
//  Created by Leo Mogiano on 20/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack (alignment:.center) {
            Text("Hola")
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .scaleEffect(animationAmount)
                .blur(radius: 1.0)
                .animation(.default,value: animationAmount)
            Spacer()
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Button("Tap Me") {
                    animationAmount += 0.5
                }
                
                .padding(20)
                .background(.red)
                .clipShape(.circle)
                .foregroundStyle(.white)
                Button("Tap Me") {
                    animationAmount -= 0.5
                }
                .padding(20)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.circle)
            }
        }
    }
}

#Preview {
    ContentView()
}
