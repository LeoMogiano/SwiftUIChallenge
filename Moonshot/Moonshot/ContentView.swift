//
//  ContentView.swift
//  Moonshot
//
//  Created by Leo Mogiano on 26/6/24.
//

import SwiftUI

//struct CustomText:View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//    }
//
//    init(text: String) {
//        print("New Text")
//        self.text = text
//    }
//}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    
                    Text("Detail \(row)")
                    
                }
            }
            .navigationTitle("SwiftUI")
        }
        //        ScrollView {
        //            LazyVStack {
        //                ForEach(0..<100) {
        //                    CustomText(text: "Item \($0)")
        //                        .font(.title)
        //                }
        //            }
        //            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        //        }
        //        Image("Example")
        //            .resizable()
        //            .scaledToFit()
        //            .containerRelativeFrame(.horizontal) { size, axis in
        //                size * 0.5
        //            }
    }
}

#Preview {
    ContentView()
}
