//
//  ContentView.swift
//  iExpense
//
//  Created by Leo Mogiano on 30/4/24.
//

import SwiftUI

//struct SecondView: View {
//    
//    @Environment(\.dismiss) var dismiss
//    
//    let name:String
//    var body: some View {
//        Text("Hello World \(name)!")
//        Button("Dismiss Screen") {
//            dismiss()
//        }
//    }
//}

struct ContentView: View {
//    @Observable
//    class User {
//        var firstName = "Leo"
//        var lastName = "Mogiano"
//    }
//    
//    @State private var showingSheet = false
//    @State private var mogiUser = User()
    
    @State private var listInt = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
//        VStack {
//            Text("\(mogiUser.firstName)")
//            Text("\(mogiUser.lastName)")
//            
//            TextField("Input de Nombre", text: $mogiUser.firstName)
//            TextField("Input de Nombre", text: $mogiUser.lastName)
//            
//            Button("Second View") {
//                showingSheet.toggle()
//            }
//        }
//        .padding()
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "Leo")
//        }
        NavigationStack {
            VStack {
                List {
                    ForEach(listInt, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    listInt.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
        
        
    }
    
    func removeRows (at offsets: IndexSet) {
        listInt.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
