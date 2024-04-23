//
//  ContentView.swift
//  Animations
//
//  Created by Leo Mogiano on 20/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0 // 1.0
    
    var body: some View {
        VStack (alignment:.center) {
//            Text("Hola")
//                .padding(50)
//                .background(.red)
//                .foregroundStyle(.white)
//                .scaleEffect(animationAmount)
//                .blur(radius: 0.0)
//                .animation(
//                    .easeInOut(duration: 2)
//                    .repeatCount(2, autoreverses: true)
//                           ,value: animationAmount
//                )
//                
//            Spacer()
//                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//            HStack {
//                Button("Tap Me") {
//                    animationAmount += 0.5
//                }
//                
//                .padding(20)
//                .background(.red)
//                .clipShape(.circle)
//                .foregroundStyle(.white)
//                Button("Tap Me") {
//                    animationAmount -= 0.5
//                }
//                .padding(20)
//                .background(.blue)
//                .foregroundStyle(.white)
//                .clipShape(.circle)
//            }
            
//            Button("Tap me") {
////                animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(.easeOut(duration: 1).repeatForever(autoreverses: false)
//                               ,value: animationAmount)
//            ).onAppear{
//                animationAmount = 2
//            }
            
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
            
            Button("Tap Me") {
                withAnimation (.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

#Preview {
    ContentView()
}
