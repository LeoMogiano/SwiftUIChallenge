//
//  ContentView.swift
//  Moonshot
//
//  Created by Leo Mogiano on 26/6/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut]
    var missions: [Mission]
    
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    init() {
        do {
            self.missions = try Bundle.main.decode("missions.json")
            self.astronauts = try Bundle.main.decode("astronauts.json")
       
        } catch {

            self.missions = []
            self.astronauts = [:]
            print("Error al cargar las misiones: \(error.localizedDescription)")
        }

    }
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                LazyVGrid( columns: columns) {
                    ForEach(missions) { mission in
                        
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.subheadline)
                                    
                            }
                        }
                        
                        
                    }
                }
            }.navigationTitle("MoonShot")
        }
    }
}

#Preview {
    ContentView()
}
