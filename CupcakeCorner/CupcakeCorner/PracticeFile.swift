//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 7/12/24.
//

//import SwiftUI
//import Observation
//
//@Observable
//class User: Codable {
//    
//    enum CodingKeys: String, CodingKey {
//        case _name = "name"
//    }
//    
//    var name = "Taylor"
//
//}
//
//struct ContentView: View {
//    @State private var results = [Result]()
//    @State private var name = ""
//    @State private var email = ""
//    
//    @State private var counter = 0
//    
//    var body: some View {
////        List(results, id: \.trackId) { item in
////            VStack(alignment: .leading) {
////                Text(item.trackName)
////                    .font(.headline)
////                Text(item.collectionName)
////            }
////        }.task {await loadData()}
//        
//        Button("Submit", action: encodeTaylor)
//            
//       
//        
//
//
//    }
//    
//    func encodeTaylor() {
//        let data = try? JSONEncoder().encode(User())
//        let str = String(decoding: data!, as: UTF8.self)
//        print(str)
//        
//        
//    }
//    
//    // validate data is
//    
//    func validateData() -> Bool {
//        return (name.count < 6) || !email.contains("@")
//    }
//    
//    func loadData() async {
//        
//        let URLString = "https://itunes.apple.com/search?term=taylor+swift&entity=song"
//        
//        guard let url = URL(string: URLString) else {
//            print("Invalid URL")
//            return
//        }
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            results = try JSONDecoder().decode(Response.self, from: data).results
//        } catch {
//            print("Invalid data")
//        }
//        
//    }
//}
//
//
//
//
//
//#Preview {
//    ContentView()
//}
