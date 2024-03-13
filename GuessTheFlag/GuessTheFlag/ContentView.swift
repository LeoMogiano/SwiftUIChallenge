//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leo Mogiano on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        ZStack {
            VStack(spacing:0) {
                Color.green
                //                Color.yellow
                //                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 500)
                Color.red
            }
            Text("Hello, world!")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        ZStack {
            //            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom )
            //            LinearGradient(stops: [
            //                .init(color: .white, location: 0.45),
            //                .init(color: .black, location: 0.55)
            //            ], startPoint: .top, endPoint: .bottom)
            //            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            //            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            //            Text("Hola")
            //                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            //                .foregroundColor(.white)
            //                .background(.indigo .gradient)
            
        }
        VStack {
            //            Button("Borrar1",action: executeDelete)
            //                .buttonStyle(.bordered)
            //            Button("Borrar2", role: .destructive ,action: executeDelete)
            //                .buttonStyle(.bordered)
            //            Button("Borrar3", action: executeDelete)
            //                .buttonStyle(.borderedProminent)
            //            Button("Borrar4", role: .destructive ,action: executeDelete)
            //                .buttonStyle(.borderedProminent)
            
            //customized
            
            //            Button {
            //                print("Edit button was tapped")
            //            } label: {
            //                Label("Edit", systemImage: "pencil")
            //                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            //                    .foregroundStyle(.white)
            //                    .background(.red)
            //            }
            //            Button {
            //                print("Edit button was tapped")
            //            } label: {
            //                Image(systemName: "pencil.circle")
            //                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            //                                .font(.largeTitle)
            //            }
            
            //            Button("Edit", systemImage: "pencil.circle") {
            //                print("Edit button was tapped")
            //            }
            
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Label("Edit", systemImage: "pencil.circle")
//                    .padding()
//                    .foregroundStyle(.white)
//                    .background(.red)
//            }
            
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please read this.")
            }
            
        }
    }
    
    func executeDelete() {
        print("Ejecutando borrar...")
    }
}

#Preview {
    ContentView()
}
