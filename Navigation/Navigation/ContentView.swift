//
//  ContentView.swift
//  NavigationApp
//
//  Created by Leo Mogiano on 5/12/24.
//

import SwiftUI
import Observation


@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct DetailView: View {
    var number: Int
    @State private var editableTitle: String = "SwiftUI"

    var body: some View {
        Text("Detail View \(number)")
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle($editableTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Tap Me") {
                        // button action here
                    }
                }

    
            }
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
        }
    }
}

//struct ContentView: View {
//    @State private var path = [String]()
//    let user: String = "Leo Mogiano"
//    
//    var body: some View {
//        
////            Problem with simple navigation
////            Load views before handling
////            List(0..<1000) { i in
////                NavigationLink("Tap Me") {
////                    DetailView(number: i)
////                }
////            }
//        
//        NavigationStack(path: $path) {
//            VStack(spacing: 20) {
//                Text("Pantalla Principal")
//                    .font(.largeTitle)
//                    .bold()
//                
//                Button("Ir a Perfil") {
//                    path.append("profile")
//                }
//                
//                Button("Ir a Configuración") {
//                    path.append("settings")
//                }
//            }
//            .padding()
//            .navigationDestination(for: String.self) { route in
//                switch route {
//                case "profile":
//                    ProfileView(userName: user)
//                case "settings":
//                    SettingsView()
//                default:
//                    Text("Ruta desconocida")
//                }
//            }
//        }
//    }
//}
//
//struct ProfileView: View {
//    
//    let userName:String
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Perfil de Usuario: \(userName)")
//                .font(.title)
//                .bold()
//            Text("Aquí puedes ver y editar tu información personal.")
//        }
//        .padding()
//    }
//}
//
//struct SettingsView: View {
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Configuración")
//                .font(.title)
//                .bold()
//            Text("Ajusta las preferencias de la aplicación aquí.")
//        }
//        .padding()
//    }
//}


#Preview {
    ContentView()
}
