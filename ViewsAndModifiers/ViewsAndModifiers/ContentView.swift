//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Leo Mogiano on 17/3/24.
//

import SwiftUI

// Encapsule Component

struct EncapsuleText: View {
    var text:String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

//Custom Modifier

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}
// Better using extension

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    //    @State private var toogleExample = false
    //    let mogi1 = Text("Leo Mogiano")
    //    let mogi2 = Text("Leonardo Mogiano")
    
    var body: some View {
        VStack {
            Text("ViewModifier")
                .titleStyle()
            EncapsuleText(text: "Leo")
                .foregroundStyle(.white)
            EncapsuleText(text: "Mogi")
                .foregroundStyle(.yellow)
            //            Button("Hello, World!"){
            //                toogleExample.toggle()
            //            }
            //            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            //            .foregroundColor(.white)
            //            .background(toogleExample ? .blue : .red)
            //
            //            //Enviroment modifiers
            //            Group {
            //                Text("Hola")
            //                    .font(.subheadline)
            //                mogi1
            //                    .foregroundStyle(.red)
            //                mogi2
            //                    .foregroundStyle(.blue)
            //            }.font(.largeTitle)
            //
            //            //Basic - doesn't work
            //            Group {
            //                Text("Hola")
            //                    .blur(radius: 0)
            //                Text("Mundo")
            //                Text("Xd!")
            //            }.blur(radius: 5)
        }
    }
}

#Preview {
    ContentView()
}
