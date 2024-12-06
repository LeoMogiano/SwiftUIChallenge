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
    
    @State private var isShowingList = false
    @State private var path = NavigationPath()
    
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
        NavigationStack(path: $path) {
            Group {
                if !isShowingList {
                    GridView(missions, astronauts)
                        
                } else {
                    ListView(missions, astronauts)
                }
                
            }.navigationTitle("MoonShot")
                .navigationDestination(for: Mission.self) { mission in
                    MissionView(mission, astronauts) // your destination view
                }
                .navigationDestination(for: Astronaut.self) { astronaut in
                    AstronautView(astronaut)
                }
                
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .toolbar{
                    Button((isShowingList) ? "Show Grid" : "Show List") {
                        isShowingList.toggle()
                    }
                }
               
        }
    }
}

#Preview {
    ContentView()
}

struct GridView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    init ( _ missions: [Mission], _ astronauts: [String: Astronaut] ) {
        self.astronauts = astronauts
        self.missions = missions
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid( columns: columns) {
                ForEach(missions) { mission in
                    
                    NavigationLink(value:mission){
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
                
        }
        
    }
}


struct ListView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    
    init ( _ missions: [Mission], _ astronauts: [String: Astronaut] ) {
        self.astronauts = astronauts
        self.missions = missions
    }
    
    var body: some View {
        
        List {
            ForEach(missions) { mission in
                NavigationLink(value:mission){
                   Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(style: StrokeStyle(lineWidth: 2)))
                        .padding()
                    VStack(alignment: .leading){
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                            .font(.subheadline)
                    }
                        
                }
            }.listRowBackground(Color(.lightBackground))
                .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }.scrollContentBackground(.hidden)
        
        
    }
}
