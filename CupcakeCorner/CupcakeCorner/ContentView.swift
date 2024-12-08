//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    @State private var name = ""
    @State private var email = ""
    
    
    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }.task {await loadData()}
        
        VStack {
            ImageView(
                url: URL(string: "https://hws.dev/img/logo.png")!,
                errorMessage: "Failed to load image.",
                loadingView: AnyView(ProgressView()),
                frameWidth: 250,
                frameHeight: 250,
                contentMode: .fit
            )
            
            Form {
                Section("Data") {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }
                Section("Submit") {
                    Button("Submit") {
                        print("Name: \(name), Email: \(email)")
                    }
                }.disabled(validateData())
            }
        }


    }
    
    // validate data is
    
    func validateData() -> Bool {
        return (name.count < 6) || !email.contains("@")
    }
    
    func loadData() async {
        
        let URLString = "https://itunes.apple.com/search?term=taylor+swift&entity=song"
        
        guard let url = URL(string: URLString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            results = try JSONDecoder().decode(Response.self, from: data).results
        } catch {
            print("Invalid data")
        }
        
    }
}





#Preview {
    ContentView()
}
