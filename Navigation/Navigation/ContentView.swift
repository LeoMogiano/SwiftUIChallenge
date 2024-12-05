//
//  ContentView.swift
//  NavigationApp
//
//  Created by Leo Mogiano on 5/12/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    @State private var path: [String] = []
    
    var body: some View {
        
//            Problem with simple navigation
//            Load views before handling
//            List(0..<1000) { i in
//                NavigationLink("Tap Me") {
//                    DetailView(number: i)
//                }
//            }
        
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Text("Pantalla Principal")
                    .font(.largeTitle)
                    .bold()
                
                Button("Ir a Perfil") {
                    path.append("profile")
                }
                
                Button("Ir a Configuración") {
                    path.append("settings")
                }
            }
            .padding()
            .navigationDestination(for: String.self) { route in
                switch route {
                case "profile":
                    ProfileView()
                case "settings":
                    SettingsView()
                default:
                    Text("Ruta desconocida")
                }
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Perfil de Usuario")
                .font(.title)
                .bold()
            Text("Aquí puedes ver y editar tu información personal.")
        }
        .padding()
    }
}

struct SettingsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Configuración")
                .font(.title)
                .bold()
            Text("Ajusta las preferencias de la aplicación aquí.")
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
