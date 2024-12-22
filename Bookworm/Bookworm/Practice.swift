//
//  Practice.swift
//  Bookworm
//
//  Created by Leo Mogiano on 22/12/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State private var rememberMe = false
//    
//    
//    var body: some View {
//        
//        PushButton(title: "Remember Me", isPressed: $rememberMe)
//                   Text(rememberMe ? "On" : "Off")
//    }
//}
//
//
//struct PushButton: View {
//    let title: String
//    @Binding var isPressed: Bool
//    
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//    
//    var body: some View {
//        Button(title){
//            isPressed.toggle()
//        }
//        .padding()
//        .background(LinearGradient(colors: isPressed ? onColors : offColors, startPoint: .top, endPoint: .bottom))
//                .foregroundStyle(.white)
//                .clipShape(.capsule)
//                .shadow(radius: isPressed ? 0 : 5)
//        
//    }
//}


//
//@AppStorage("notes") private var notes = ""
//
//var body: some View {
//    NavigationStack {
//        TextField("Enter your text", text: $notes, axis: .vertical)
//            .textFieldStyle(.roundedBorder)
//            .navigationTitle("Notes")
//            .padding()
//        Spacer()
//    }
//}



//import SwiftUI
//import SwiftData
//
//struct ContentView: View {
//    @Environment(\.modelContext) var modelContext
//    @Query var students: [Student]
//    
//    var body: some View {
//        NavigationStack {
//            List(students) { student in
//                Text("\(student.name)")
//            }.navigationTitle("Classroom")
//                .toolbar{
//                    Button("Add") {
//                        let firstsNames = ["Leo", "Max", "Emil"]
//                        let lastNames = ["Mogiano", "Schmidt", "Schneider"]
//                        
//                        let chosenFirstName = firstsNames.randomElement()!
//                        let chosenLastName = lastNames.randomElement()!
//                        
//                        let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
//                        
//                        modelContext.insert(student)
//                    }
//                }
//        }
//        
//    }
//}
