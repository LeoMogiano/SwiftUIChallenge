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
                        
                        NavigationLink(destination:MissionView(mission, astronauts)){
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding(.vertical, 15)
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.subheadline)
                                        .foregroundStyle(.white.opacity(0.4))
                                }.padding(.vertical, 5)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            }.padding(.vertical, 4)
                        }
                        
                    }
                }.padding([.horizontal, .bottom])
            }.navigationTitle("MoonShot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
