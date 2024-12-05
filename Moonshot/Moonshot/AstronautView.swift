//
//  AstronautView.swift
//  Moonshot
//
//  Created by Leo Mogiano on 4/12/24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    AstronautView()
//}
